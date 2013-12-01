require 'should'
$ = require 'jquery'
Scraper = require '../scrapers/sky'

describe 'testing', ->

  it 'loads the fixture html', (done) ->
    require('fs').readFile './spec/fixtures/news.sky.com.html', 'utf8', (err, html) ->
      this.scraper = new Scraper html
      done()

describe 'sky scraping', ->

  domify = (fragment) -> $("<html><body>#{fragment}</body></html>")

  describe 'top story', ->

    it 'is obtained from a function', ->
      scraper.top.should.be.type 'function'

    it 'is parsed from the html', ->
      top = scraper.top()
      domify(top).find('strong').html().should.contain 'Helicopter Crashes Into'

  describe 'secondary stories', ->

    it 'are obtained from a function', ->
      scraper.secondary.should.be.type 'function'

    it 'are parsed from the html', ->
      secondary = scraper.secondary()
      secondary.should.be.instanceOf Array
      secondary.length.should.equal 3
      secondary[0].should.include 'Video Of Helicopter'
      secondary[1].should.include 'Glasgow Helicopter'
      secondary[2].should.include 'Pilots Concerned'

  describe 'tertiary stories', ->

    it 'are obtained from a function', ->
      scraper.tertiary.should.be.type 'function'

    it 'are parsed from the html', ->
      tertiary = scraper.tertiary()
      tertiary.should.be.instanceOf Array
      tertiary.length.should.equal 6
      tertiary[0].should.include 'Ministers To Fund'
      tertiary[1].should.include 'Identity Of Man'
      tertiary[2].should.include 'American Held'
      tertiary[3].should.include 'Latest Oz'
      tertiary[4].should.include 'Romanian PM'
      tertiary[5].should.include 'Trial Marine'

  describe 'all', ->

    it 'are obtained from a function', ->
      scraper.all.should.be.type 'function'

    it 'concatenates all news removing whitespace', ->
      all = scraper.top() + scraper.secondary().join('') + scraper.tertiary().join('')
      scraper.all().should.be.equal all.replace(/[\n\r\t]/g, '').trim()
