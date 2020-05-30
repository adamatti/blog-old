.DEFAULT_GOAL := help

.PHONY: clean
clean:
	@rm -rf _site
	@rm -rf .jekyll-cache
	@rm -f .jekyll-metadata
	@rm -f asciidoc-pygments.css
	@rm -f Gemfile.lock

setup: ## initial setup (e.g. install jekyll, bundler)
	gem install jekyll bundler --verbose

install:
	bundle install

.PHONY: build
build: ## build site (e.g. generate html files)
	#jekyll build
	JEKYLL_ENV=production bundle exec jekyll build --trace

.PHONY: run
run: ## run app on local box
	JEKYLL_ENV=production bundle exec jekyll serve --watch --incremental

all: clean install build run

dc-build:
	@docker-compose build

dc-sh: dc-build
	@docker-compose run app /bin/sh

dc-run: dc-build
	@docker-compose up

.PHONY: help
help: ## show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'