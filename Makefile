test:
	./node_modules/.bin/mocha --compilers coffee:coffee-script --reporter spec test

.PHONY: test
