upload
======

Simple episode upload

Requirements:
- ffmpeg
- jq
- ftp
- python3

To install python dependencies:
- `pip3 install google-api-python-client google_auth_oauthlib`

1. Create an episode JSON file and edit it
1. Put a copy of `client_secret.json` in this directory
1. Use `./bin/youtube.py --file ep6.mp4 --config ep6.json` to upload to YouTube. This requires setting up auth. Note down the video ID.
1. Run `FTP_PASSWORD=supersecret ./bin/libsyn.sh ep6.json ep6.mp4` and it the audio will be processed and uploaded to Libsyn
1. Head over to Libsyn and publish the podcast (make sure to check populate data from ID3 tags when selecting the file) - copy the ID
1. Run `./bin/blog-post.sh ep6.json $YOUTUBE_ID $LIBSYN_ID` to generate the blog post