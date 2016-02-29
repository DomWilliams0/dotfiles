#!/bin/python2
import argparse
import os
import socket
import sys
import urllib2

import lxml.html as lx


def download(url):
    """
    Downloads the given URL
    :return: The contents of the URL, or None if it failed or if the global flag 'online' is False
    """
    global online
    if not online:
        return None

    print "Attempting to download '%s'" % url
    try:
        return urllib2.urlopen(urllib2.Request(url, headers={
            'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.64 Safari/537.11',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Accept-Charset': 'ISO-8859-1,utf-8;q=0.7,*;q=0.3',
            'Accept-Encoding': 'none',
            'Accept-Language': 'en-US,en;q=0.8',
            'Connection': 'keep-alive'})).read()
    except (urllib2.HTTPError, socket.error) as e:
        sys.stderr.write("Failed to download '%s': %s\n" % (url, e))
        online = False
        return None


def fetch_image(resource):
    """
    Fetches the contents of the given resource, be it a file or a URL
    :param resource: A collection of URIs for a single resource
    :return: (the contents of the resource, the successful URI) or None if it fails
    """
    for u in resource:
        if u.startswith("http"):
            d = download(u)
        else:
            d = open(u, 'rw').read()
        if d:
            return d, u


def get_image_resources(url, local_dir, local, shuffle=True):
    """
    :param url: The URL to download from. Ignored if local is Trye
    :param local_dir: The directory to save wallpapers to, and load from if offline
    :param local: True if images are to be loaded from 'local_dir'
    :param shuffle: If True, the URIs are shuffled before being returned
    :return: A list of resources, which are lists of URIs for a single resource
    """
    html = None if local else download(url)
    uris = []

    if html:
        thumbs = lx.fromstring(html).find_class('thumb')
        for t in thumbs:
            wp_html_url = str(t.find('a').attrib.get('href'))
            wp_id = wp_html_url[wp_html_url.rindex('/') + 1:]
            uri = []
            for ext in "jpg", "png":
                uri.append('http://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-%s.%s' % (wp_id, ext))
            uris.append(uri)

    else:
        if not local:
            print "Cannot connect to site, using local images instead"
        import glob
        for e in ("*.png", "*.jpg", "*.jpeg"):
            for i in glob.glob(local_dir + e):
                uris.append([i])

    if shuffle:
        from random import shuffle
        shuffle(uris)

    return uris


parser = argparse.ArgumentParser(description="Download random wallpapers from wallhaven.cc")
parser.add_argument('-n', default=1, type=int, help='The number of wallpapers to download and set')
parser.add_argument('-d', default='/tmp/', help='The directory to save downloaded wallpapers to', dest='out_dir')
parser.add_argument('--url',
                    default='http://alpha.wallhaven.cc/search?q=%22digital%20art%22&categories=111&purity=100&resolutions=1920x1080&sorting=random&order=desc',
                    help='The wallhaven URL to steal wallpapers from')
parser.add_argument('--no-feh', default=False, action='store_true', help='If given, just print the wallpaper paths, otherwise call feh with --bg-fill')
parser.add_argument('--local', default=False, action='store_true',
                    help='If given, local images from the output directory are used, instead of downloading new ones')
parser.add_argument('--timeout', help='Sets the socket timeout in seconds', type=float, required=False)

args = parser.parse_args()
online = not args.local
args.out_dir = os.path.expandvars(os.path.expanduser(os.path.abspath(args.out_dir)))
if args.timeout:
    socket.setdefaulttimeout(args.timeout)

if args.n <= 0:
    sys.exit(0)

images = get_image_resources(args.url, args.out_dir, args.local)
paths = []
for uri in images:
    if not uri:
        continue

    if len(paths) >= args.n:
        break

    im_and_uri = fetch_image(uri)
    if not im_and_uri:
        sys.stderr.write("Skipping resource '%s'\n" % uri)
        continue

    image, uri = im_and_uri

    out_path = os.path.join(args.out_dir, os.path.basename(uri))
    with open(out_path, 'wb') as out:
        print "Downloaded image of size %d to %s" % (len(image), (os.path.expandvars(os.path.expanduser(os.path.abspath(args.out_dir)))))
        out.write(image)
    paths.append(out_path)

if not paths:
    print "No wallpapers found"
    sys.exit(3)

if not args.no_feh:
    wallpapers = ' '.join(paths)
    cmd = "feh --bg-fill %s" % wallpapers
    print "Executing '%s'" % cmd
    os.system(cmd)
else:
    print "The following are n file paths to the local wallpapers"
    for p in paths:
        print p
