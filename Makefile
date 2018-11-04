.DEFAULT_GOAL := help

setup: ## initial setup (e.g. install jekyll, bundler)
	gem install jekyll bundler
	bundle install

.PHONY: build
build: ## build site (e.g. generate html files)
	#jekyll build
	bundle exec jekyll build

.PHONY: run
run: ## run app on local box
	bundle exec jekyll serve --watch --incremental

.PHONY: help
help: ## show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'