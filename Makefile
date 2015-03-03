D3_FOR_QADI_FILES = \
	node_modules/d3/src/start.js \
	node_modules/d3/src/selection/select.js \
	node_modules/d3/src/selection/selectAll.js \
	node_modules/d3/src/selection/selection.js \
	node_modules/d3/src/selection/classed.js \
	node_modules/d3/src/arrays/set.js \
	node_modules/d3/src/event/dispatch.js \
	end.js
 

D3_FOR_PRONG_FILES = \
	node_modules/d3/src/start.js \
	node_modules/d3/src/arrays/mean.js \
	node_modules/d3/src/arrays/sum.js \
	node_modules/d3/src/arrays/max.js \
	node_modules/d3/src/arrays/min.js \
	node_modules/d3/src/arrays/set.js \
	node_modules/d3/src/arrays/nest.js \
	node_modules/d3/src/scale/linear.js \
	node_modules/d3/src/scale/log.js \
	node_modules/d3/src/scale/category.js \
	node_modules/d3/src/svg/area.js \
	node_modules/d3/src/svg/line.js \
	node_modules/d3/src/svg/axis.js \
	node_modules/d3/src/svg/arc.js \
	node_modules/d3/src/behavior/drag.js \
	node_modules/d3/src/selection/selection.js \
	node_modules/d3/src/event/*.js \
	node_modules/d3/src/xhr/json.js \
	end.js



d3-qadi.js: $(D3_FOR_QADI_FILES)
	node_modules/.bin/smash $(D3_FOR_QADI_FILES) > $@
 
d3-qadi-min.js: d3-qadi.js
	@node_modules/uglify-js/bin/uglifyjs -c -m -o $@ d3-qadi.js



d3-prong.js: $(D3_FOR_PRONG_FILES)
	node_modules/.bin/smash $(D3_FOR_PRONG_FILES) > $@
 
d3-prong-min.js: d3-prong.js
	@node_modules/uglify-js/bin/uglifyjs -c -m -o $@ d3-prong.js

list: 
	@perl -ne'print "$$1\n" if /^([^\.][\w-\.]*):/ and not /^list/' Makefile