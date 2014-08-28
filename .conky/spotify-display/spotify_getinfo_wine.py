#!/usr/bin/python2

import os
import feedparser
import urllib2

file_data =open(os.getenv('HOME') + '/.conky/spotify-display/data_wine.txt', 'r')
data = file_data.read().split('\n')

def perfect_length(str):
  if len(str) > 16:
    return str[:14] + '...'
  else:
    return str

playing_artist = data[1]
playing_song = data[2]

print(perfect_length(playing_artist) + "\n${goto 15}" + perfect_length(playing_song))

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

os.system("spotifycmd status > $HOME/.conky/spotify-display/data_wine.txt")