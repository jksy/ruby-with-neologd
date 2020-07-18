# =======================================
## build mecab-ipadic-neologd
FROM ruby:2.6.5 as build-neologd
MAINTAINER Junichiro Kasuya <junichiro.kasuya@gmail.com>
RUN apt-get update -qq && \
    apt-get install -y build-essential libmecab-dev mecab git sudo locales
RUN locale-gen ja_JP.UTF-8
RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

# install mecab-ipadic-neologd
## copy mecab-ipadic-neologd  from local cloned repository for installing
COPY ./local/ $APP_ROOT/local/
RUN cd $APP_ROOT/local/mecab-ipadic-neologd && ( echo yes | ./bin/install-mecab-ipadic-neologd )

# =======================================
## build application image
FROM ruby:2.6.5
MAINTAINER Junichiro Kasuya <junichiro.kasuya@gmail.com>

RUN apt-get update -qq && \
    apt-get install -y build-essential nodejs default-mysql-client libmecab-dev mecab git sudo locales
RUN locale-gen ja_JP.UTF-8
RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

## copy mecab-ipadic-neologd
COPY --from=build-neologd /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd/ /usr/lib/x86_64-linux-gnu/mecab/dic/mecab-ipadic-neologd

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

