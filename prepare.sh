#!/bin/sh
# ref. https://raw.githubusercontent.com/sashaegorov/docker-alpine-sinatra/master/app/prepare.sh
# Localy used variables
export RACK_HOME="/app"
export RACK_ENV="production"
# Prerequisites
apk -U add alpine-sdk openssl-dev ruby-dev openssl-dev
apk -U add ruby ruby-bundler ruby-io-console
echo 'gem: --no-document' > ~/.gemrc #http://stackoverflow.com/questions/1381725
cd ${RACK_HOME} && \
bundle install --clean --jobs=4 && \
gem clean
# Mission completed
apk -U --purge del alpine-sdk openssl-dev ruby-dev openssl-dev
rm -vrf /var/cache/apk/*
rm -v $0