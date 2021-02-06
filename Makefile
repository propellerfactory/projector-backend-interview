readme:
	@echo ""
	@echo "Check out README.md for instructions on using this Makefile"
	@echo ""

update:
	npm install

watch:
	./node_modules/.bin/webpack --config ./webpack.config.js --env.NODE_ENV development --mode development --watch

tests:
	npm run test $(TEST)

watch-tests:
	npm run test $(TEST) -- --watch
