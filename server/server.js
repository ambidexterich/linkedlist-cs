var express = require('express');
var fs = require('fs');
var _ = require('underscore');
var open = require('open');
staticDir = express['static'];

var site = express();

module.exports = function (options) {
	var options = _.extend({
		port : 1234,
		baseDir : './'
	}, options || {});

	site.configure(function() {
		site.use('/LinkedList.js', staticDir(options.baseDir + 'src/LinkedList.js'));
		site.use('/test', staticDir(options.baseDir + 'test'));
		site.use(express.bodyParser());
	});


	site.get("/", function (req, res) {
		fs.createReadStream(options.baseDir + 'test/runner.html').pipe(res);
	});
	site.get("/LinkedList.js", function (req, res) {
		fs.createReadStream(options.baseDir + 'src/LinkedList.js').pipe(res);
	})
	site.listen(options.port);
	console.log("\n\nServing at http://localhost:" + options.port + ". (Ctrl+C to exit)");
	open("http://localhost:" + options.port);
};