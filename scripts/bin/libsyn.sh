#!/bin/sh
# Usage: ./upload ep4.json ep4.mp4
#
# Sample JSON:
# { "episode": 4, "title": "foo", "description": "bar"}

set -ex

if [ -z $1 ]; then
    echo "No episode JSON provided"
    exit 1
fi
EPISODE_JSON=$1

if [ -z "$2" ]; then
    echo "No episode video file provided"
fi
VIDEO=$2

FTP_USERNAME=thenetlolpodcast@gmail.com
if [ -z "${FTP_PASSWORD}" ]; then
    echo "Please export FTP_PASSWORD"
fi

EPISODE_NUMBER="$(jq -r '.episode' $EPISODE_JSON)"
EPISODE_TITLE="$(jq -r '.title' $EPISODE_JSON)"
EPISODE_DESC="$(jq -r '.description' $EPISODE_JSON)"
OUTPUT="the-net-podcast-e${EPISODE_NUMBER}.mp3"

# extract audio, make mono, add metadata
ffmpeg \
    -y \
    -i "$VIDEO" \
    -codec:a libmp3lame -ar 44100 -b:a 96k \
    -map_channel 0.1.0 \
    -write_id3v2 1 \
    -metadata track="${EPISODE_NUMBER}" \
    -metadata title="Episode ${EPISODE_NUMBER} - ${EPISODE_TITLE}" \
    -metadata "album=The Net Podcast" \
    -metadata "artist=The Net Podcast" \
    -metadata "lyric=${EPISODE_DESCRIPTION}" \
    ${OUTPUT}

ftp -p -n -v ftp-lax.libsyn.com 990 << EOF
ascii
user $FTP_USERNAME $FTP_PASSWORD
prompt
cd thenet/dropbox
put ${OUTPUT}
bye
EOF
