FROM ruby:3.2.1

USER root
RUN gem install public_suffix sass-embedded jekyll bundler

WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

ADD . /app
RUN bundle exec jekyll build

CMD JEKYLL_ENV=production bundle exec jekyll serve