test:
	./node_modules/.bin/mocha --compilers coffee:coffee-script --reporter spec spec

.PHONY: test
