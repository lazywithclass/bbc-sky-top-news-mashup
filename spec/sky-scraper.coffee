require 'coffee-script'
$ = require 'jquery'
scraper = require '../scrapers/sky'
htmlFixture = ''

should = require 'should'

describe 'testing', ->

  it 'loads the fixture html', (done) ->
    require('fs').readFile './spec/fixtures/bbc.news.html', 'utf8', (err, html) ->
      htmlFixture = html
      done()

describe 'sky scraping', ->

  domify = (fragment) -> $("<html><body>#{fragment}</body></html>")

