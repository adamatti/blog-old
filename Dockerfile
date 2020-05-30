FROM "ruby:2.6.5"

USER root
RUN gem install public_suffix -v '4.0.5'
RUN gem install jekyll bundler

WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install

ADD . /app
RUN bundle exec jekyll build

CMD JEKYLL_ENV=production bundle exec jekyll serve