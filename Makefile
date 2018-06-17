.DEFAULT_GOAL := run

setup:
	gem install jekyll bundler
	bundle install

.PHONY: build
build:
	#jekyll build
	bundle exec jekyll build

.PHONY: run
run:
	bundle exec jekyll serve --watch --incremental