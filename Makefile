D3_FOR_QADI_FILES = \
	node_modules/d3/src/start.js \
	node_modules/d3/src/selection/select.js \
	node_modules/d3/src/selection/selectAll.js \
	node_modules/d3/src/selection/selection.js \
	node_modules/d3/src/selection/classed.js \
	node_modules/d3/src/arrays/set.js \
	node_modules/d3/src/event/dispatch.js \
	end.js
 

d3-qadi.js: $(D3_FOR_QADI_FILES)
	node_modules/.bin/smash $(D3_FOR_QADI_FILES) > $@
 
d3-qadi-min.js: d3-qadi.js
	@node_modules/uglify-js/bin/uglifyjs -c -m -o $@ d3-qadi.js
 
list: 
	@perl -ne'print "$$1\n" if /^([^\.][\w-\.]*):/ and not /^list/' Makefile