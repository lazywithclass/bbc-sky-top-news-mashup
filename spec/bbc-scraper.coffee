require 'coffee-script'
$ = require 'jquery'
scraper = require '../scrapers/bbc'
htmlFixture = ''

should = require 'should'

describe 'testing', ->

  it 'loads the fixture html', (done) ->
    require('fs').readFile './spec/fixtures/bbc.co.uk.news.html', 'utf8', (err, html) ->
      htmlFixture = html
      done()

describe 'bbc scraping', ->

  domify = (fragment) -> $("<html><body>#{fragment}</body></html>")

  describe 'top story', ->

    it 'exports a function', ->
      scraper.top.should.be.type 'function'

    it 'parses the html extracting the story', ->
      top = scraper.top htmlFixture
      domify(top).find('.top-story-header a').html().should.contain 'China jets scrambled in air zone'

  describe 'second story', ->

    it 'exports a function', ->
      scraper.second.should.be.type 'function'

    it 'parses the html extracting the story', ->
      second = scraper.second htmlFixture
      domify(second).find('.secondary-story-header a').html().should.contain 'EU rejects Russia \'veto\' on Ukraine'

  describe 'third story', ->

    it 'exports a function', ->
      scraper.third.should.be.type 'function'

    it 'parses the html extracting the story', ->
      third = scraper.third htmlFixture
      domify(third).find('.secondary-story-header a').html().should.contain 'German policeman in \'cannibal\' case'

  describe 'other stories with summary', ->

    it 'exports a function', ->
      scraper.othersWithSummary.should.be.type 'function'

    it 'parses the html extracting the other stories with a summary', ->
      othersWithSummary = scraper.othersWithSummary htmlFixture
      othersWithSummary.should.be.instanceOf Array
      othersWithSummary.length.should.equal 3
      othersWithSummary[0].should.include 'Africa row over Zuma'
      othersWithSummary[1].should.include 'Violence mars Black Friday'
      othersWithSummary[2].should.include 'Brazilian soldiers of the'

  describe 'other stories', ->

    it 'exports a function', ->
      scraper.others.should.be.type 'function'

    it 'parses the html extracting the other stories', ->
      others = scraper.others htmlFixture
      others.should.be.instanceOf Array
      scraper.others(htmlFixture, 3).length.should.equal 3
      scraper.others(htmlFixture, 6).length.should.equal 6
      scraper.others(htmlFixture).length.should.equal 4

