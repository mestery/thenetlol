#!/bin/sh
# Usage: ./blog-post.sh ep4.json
#
# Sample JSON:
# { "episode": 4, "title": "foo", "description": "bar"}

set -ex

if [ -z $1 ]; then
    echo "No episode JSON provided"
    exit 1
fi

if [ -z $2 ]; then
    echo "No youtube code provided"
    exit 1
fi
YOUTUBE=$2

if [ -z $3 ]; then
    echo "No libsyn code provided"
    exit 1
fi
LIBSYN=$3

EPISODE_JSON=$1
EPISODE_NUMBER="$(jq -r '.episode' $EPISODE_JSON)"
EPISODE_TITLE="$(jq -r '.title' $EPISODE_JSON)"
EPISODE_DESC="$(jq -r '.description' $EPISODE_JSON)"
DATE=$(date +"%Y-%M-%d")
OUTPUT="../content/episodes/episode${EPISODE_NUMBER}.md"

cat << EOF > "${OUTPUT}"
+++
title = "Episode ${EPISODE_NUMBER} - ${EPISODE_TITLE}"
date = "2021-01-11"
[ author ]
  name = "thenet.lol"
+++

${EPISODE_DESC}

Watch the episode on YouTube:

{{< youtube ${YOUTUBE} >}}

Or listen here:

{{< libsyn-player ${LIBSYN} >}}

{{< podcasts >}}
EOF