test:
	./node_modules/.bin/mocha --compilers coffee:coffee-script --reporter spec spec

run:
	node server.js
