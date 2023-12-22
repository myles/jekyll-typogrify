.PHONY: setup
setup:
	bundle install --path vendor/bundle

.PHONY: test
test:
	bundle exec rake

.PHONY: jekyll
jekyll:
	bundle exec jekyll serve \
		--config ./spec/fixtures/_config.yml \
		-d ./spec/dest \
		-s ./spec/fixtures/ \
		--watch

.PHONY: console
console:
	bundle exec ruby bin/console

.PHONY: lint
lint:
	bundle exec rufo -c .
	bundle exec rubocop

.PHONY: lintfix
lintfix:
	bundle exec rufo .
	bundle exec rubocop -a
