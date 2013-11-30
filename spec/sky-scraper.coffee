require 'coffee-script'
$ = require 'jquery'
scraper = require '../scrapers/sky'
htmlFixture = ''

should = require 'should'

describe 'testing', ->

  it 'loads the fixture html', (done) ->
    require('fs').readFile './spec/fixtures/news.sky.com.html', 'utf8', (err, html) ->
      htmlFixture = html
      done()

describe 'sky scraping :)', ->

  domify = (fragment) -> $("<html><body>#{fragment}</body></html>")

  describe 'top story', ->

    it 'exports a function', ->
      scraper.top.should.be.type 'function'

    it 'parses the html extracting the story', ->
      top = scraper.top htmlFixture
      domify(top).find('strong').html().should.contain 'Helicopter Crashes Into'

  describe 'secondary stories', ->

    it 'exports a function', ->
      scraper.secondary.should.be.type 'function'

    it 'parses the html extracting the story', ->
      secondary = scraper.secondary htmlFixture
      secondary.should.be.instanceOf Array
      secondary.length.should.equal 3
      secondary[0].should.include 'Video Of Helicopter'
      secondary[1].should.include 'Glasgow Helicopter'
      secondary[2].should.include 'Pilots Concerned'

  describe 'tertiary stories', ->

    it 'exports a function', ->
      scraper.tertiary.should.be.type 'function'

    it 'parses the html extracting the other stories', ->
      tertiary = scraper.tertiary htmlFixture
      tertiary.should.be.instanceOf Array
      tertiary.length.should.equal 6
      tertiary[0].should.include 'Ministers To Fund'
      tertiary[1].should.include 'Identity Of Man'
      tertiary[2].should.include 'American Held'
      tertiary[3].should.include 'Latest Oz'
      tertiary[4].should.include 'Romanian PM'
      tertiary[5].should.include 'Trial Marine'
