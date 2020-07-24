#!/usr/bin/bash
RUBY_VERSION=2.6.5
BUILD_DATE=`date +'%Y%m%d'`
BUILD_DATE=$BUILD_DATE docker-compose build --force-rm
docker push jksy/ruby-with-neologd:${RUBY_VERSION}-latest
docker push jksy/ruby-with-neologd:${RUBY_VERSION}-${BUILD_DATE}
