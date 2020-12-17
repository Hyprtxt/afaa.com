# MAINTAINER Taylor Young <tdy721@gmail.com>

FROM node:dubnium-alpine3.10

RUN apk add --no-cache --virtual .gyp \
        python \
        make \
        g++ \