FROM ruby:2.6-slim

RUN apt-get update && apt-get install -y make

COPY potting-bench/gems.rb /opt/potting-bench/
WORKDIR /opt/potting-bench
RUN bundle install

COPY potting-bench/ /opt/potting-bench
