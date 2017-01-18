FROM ruby:2.4.0-slim

RUN apt-get update \
	&& apt-get install -y --no-install-recommends git

RUN mkdir /tictac
ADD . /tictac
WORKDIR /tictac

RUN bundle install
RUN bundle exec rake install

ENTRYPOINT [ "tictac" ]
