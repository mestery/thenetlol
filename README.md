# thenet.lol

[![Netlify Status](https://api.netlify.com/api/v1/badges/95a1eb21-cb8f-418f-a9e5-588a34a338e3/deploy-status)](https://app.netlify.com/sites/jolly-edison-34b33d/deploys)
[![GitHub license](https://img.shields.io/badge/license-Apache%20license%202.0-blue.svg)](https://github.com/mestery/thenetlol/blob/master/LICENSE)

This is static content for the website https://thenet.lol, which is
generated using Hugo.

## Spinning up Hugo Locally

You can setup Hugo locally for testing and previewing changes. First, install [Hugo](https://gohugo.io).

```shell script
# Linux 
$ apt-get install hugo
# or
$ dnf install hugo

# OSX
$ brew install hugo

# Windows
$ choco install hugo -confirm
```

Clone the repository and initialize the git submodules.

```shell script
$ git clone https://github.com/mestery/thenetlol.git
$ cd thenetlol
$ git submodule init
$ git submodule update
```
 
 Start hugo from inside the repo with `hugo server` and the site contents will be displayed in the URL Hugo returns.
 
 ```shell script
$ hugo server
                   | EN
-------------------+-----
  Pages            | 11
  Paginator pages  |  0
  Non-page files   |  0
  Static files     | 14
  Processed images |  0
  Aliases          |  6
  Sitemaps         |  1
  Cleaned          |  0

Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```
