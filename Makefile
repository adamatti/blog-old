.DEFAULT_GOAL := run

.PHONY: build
build:
	#jekyll build
	bundle exec jekyll build

.PHONY: run
run:
	jekyll serve --watch --incremental