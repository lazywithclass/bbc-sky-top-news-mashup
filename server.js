var restify = require('restify'),
    server = restify.createServer(),
    BBCScraper = require('./scrapers/bbc'),
    SkyScraper = require('./scrapers/sky'),
    request = require('request');

var bbcContent = '';
function fetchBBC () {
  request('http://www.bbc.co.uk/news/', function(err, res, html) {
    bbcContent = new BBCScraper(html).all();
  });
}
fetchBBC();
setInterval(fetchBBC, 60000);

var skyContent = '';
function fetchSky () {
  request('http://news.sky.com/', function(err, res, html) {
    skyContent = new SkyScraper(html).all();
  });
}
fetchSky();
setInterval(fetchSky, 60000);

server.get('/bbc', function(req, res) {
  res.header('Access-Control-Allow-Origin', '*'); 
  res.send(bbcContent);
});

server.get('/sky', function(req, res) {
  res.header('Access-Control-Allow-Origin', '*'); 
  res.send(skyContent);
});

server.listen(8080, function() {
  console.log('%s listening at %s', server.name, server.url);
});
