[![Build Status](https://cloud.drone.io/api/badges/AngelFreak/docker-ssg/status.svg)](https://cloud.drone.io/AngelFreak/docker-ssg)
# docker-ssg

Docker image for ssg static site generator (https://www.romanzolotarev.com/ssg.html)

# Supported tags and respective `Dockerfile` links

-	[`5.0.1`, `5.0`, `5`, `latest`](https://github.com/AngelFreak/docker-ssg/blob/master/3/Dockerfile)
-	[`4.0.2`, `4.0`, `4`](https://github.com/AngelFreak/docker-ssg/blob/master/4/Dockerfile)
-	[`3.0.2`, `3.0`, `3`](https://github.com/AngelFreak/docker-ssg/blob/master/3/Dockerfile)

## Versions
I try to follow Romans releases, so if you download version 4, it's also version 4 of SSG.

## Environment Variables

* `SITE`
* `URL`

## Executing
    docker run -v $(pwd):/src -v /usr/local/nginx/html:/dst -e SITE=mysite -e URL=myurl angelfreak/ssg

## Building The Image Yourself (optional)
The image is a bit, big **around 165 MB** it uses [alpine](http://gliderlabs.viewdocs.io/docker-alpine):

    docker build -t angelfreak/ssg:latest .

        docker images | grep ssg
            angelfreak/ssg   latest              7eb6fdfd20c9        32 second ago      162 MB
