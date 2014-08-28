#!/usr/bin/python2

import dbus
import os
import feedparser
import urllib2


bus = dbus.SessionBus()
player = bus.get_object('com.spotify.qt', '/')
iface = dbus.Interface(player, 'org.freedesktop.MediaPlayer2')
info = iface.GetMetadata()

def perfect_length(str):
	if len(str) > 16:
		return str[:14] + '...'
	else:
		return str

# OUT: [dbus.String(u'xesam:album'), dbus.String(u'xesam:title'), dbus.String(u'xesam:trackNumber'), dbus.String(u'xesam:artist'), dbus.String(u'xesam:discNumber'), dbus.String(u'mpris:trackid'), dbus.String(u'mpris:length'), dbus.String(u'mpris:artUrl'), dbus.String(u'xesam:autoRating'), dbus.String(u'xesam:contentCreated'), dbus.String(u'xesam:url')]
playing_song = str(info['xesam:title'])
playing_artist = str(info['xesam:artist'][0])
playing_album = str(info['xesam:album'])

print(perfect_length(playing_artist) + "\n${goto 10}" + perfect_length(playing_song))

url = "http://ws.audioscrobbler.com/1.0/user/ers21/recenttracks.rss"
feed = feedparser.parse(url)
album_link = feed[ "items" ][0][ "link" ].encode('utf8')

soup = urllib2.urlopen(album_link+'/+albums').readlines()

fstored_album = open(os.getenv('HOME') + '/.conky/spotify-display/stored_album.txt', 'r')
stored_album = fstored_album.readline().strip('\n')
fstored_album.close()

for line in soup:
	if "mega" in line:
		line_ = line.rsplit('mega":"')[0]
		line_ = line.replace(line_, '').strip('mega":"').split('","original"')[0].replace('\/','/')
		break

if str(line_.rsplit('/')[-1]) != stored_album:
	os.system("wget -O $HOME/.conky/spotify-display/latest.png \"http://userserve-ak.last.fm/serve/174s/"+str(line_.rsplit('/')[-1]) + "\"")

	os.system("echo \"" +str(line_.rsplit('/')[-1])+ "\" > $HOME/.conky/spotify-display/stored_album.txt")