#!/usr/bin/env bash

# Following command to check current UTI
# duti -x <ext>

# Videos
duti -s io.mpv .mp4 all
duti -s io.mpv .m4v all
duti -s io.mpv .webm all
duti -s io.mpv .mkv all
duti -s io.mpv .avi all
duti -s io.mpv .mov all

# Audio
duti -s io.mpv .mp3 all
duti -s io.mpv .flac all
duti -s io.mpv .m4a all
duti -s io.mpv .aac all
duti -s io.mpv .ogg all

# eBooks
duti -s net.kovidgoyal.calibre .epub all
duti -s net.kovidgoyal.calibre .mobi all
