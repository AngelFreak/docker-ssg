[![Build Status](https://cloud.drone.io/api/badges/AngelFreak/docker-ssg/status.svg)](https://cloud.drone.io/AngelFreak/docker-ssg)
# docker-ssg

Docker image for ssg static site generator (https://www.romanzolotarev.com/ssg.html)

# Supported tags and respective `Dockerfile` links

-	[`5.0.0`, `5.0`, `5`, `latest`](https://github.com/AngelFreak/docker-ssg/blob/main/Dockerfile)

## Versions
I try to follow Romans releases, so if you download version 5, it's also version 5 of SSG.
In version 5.x.x lowdown 0.7.4 is used.

## Environment Variables

* `SITE`
* `URL`

## Executing
    docker run -v $(pwd):/src -v $(pwd):/dst -e SITE=mysite -e URL=myurl angelfreak/ssg

## Building The Image Yourself (optional)
The image is based on [alpine](http://gliderlabs.viewdocs.io/docker-alpine):

    docker build -t angelfreak/ssg:latest .

        docker images | grep ssg
            angelfreak/ssg   latest              4f31e7b582bd        21 minutes ago      4.79MB
