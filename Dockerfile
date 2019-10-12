FROM ruby:2.6.3-stretch

WORKDIR /src/build

COPY ./Gemfile /src/build
COPY ./Gemfile.lock /src/build

RUN gem install bundler:2.0.2
RUN bundle install

WORKDIR /srv/jekyll

EXPOSE 4000
