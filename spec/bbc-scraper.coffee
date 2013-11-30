require 'should'
$ = require 'jquery'
Scraper = require '../scrapers/bbc'

describe 'testing', ->

  it 'loads the fixture html', (done) ->
    require('fs').readFile './spec/fixtures/bbc.co.uk.news.html', 'utf8', (err, html) ->
      this.scraper = new Scraper html
      done()

describe 'bbc scraping', ->

  domify = (fragment) -> $("<html><body>#{fragment}</body></html>")

  describe 'top story', ->

    it 'exports a function', ->
      scraper.top.should.be.type 'function'

    it 'parses the html extracting the story', ->
      top = scraper.top()
      domify(top).find('.top-story-header a').html().should.contain 'China jets scrambled in air zone'

  describe 'second story', ->

    it 'exports a function', ->
      scraper.second.should.be.type 'function'

    it 'parses the html extracting the story', ->
      second = scraper.second()
      domify(second).find('.secondary-story-header a').html().should.contain 'EU rejects Russia \'veto\' on Ukraine'

  describe 'third story', ->

    it 'exports a function', ->
      scraper.third.should.be.type 'function'

    it 'parses the html extracting the story', ->
      third = scraper.third()
      domify(third).find('.secondary-story-header a').html().should.contain 'German policeman in \'cannibal\' case'

  describe 'other stories with summary', ->

    it 'exports a function', ->
      scraper.othersWithSummary.should.be.type 'function'

    it 'parses the html extracting the other stories with a summary', ->
      othersWithSummary = scraper.othersWithSummary()
      othersWithSummary.should.be.instanceOf Array
      othersWithSummary.length.should.equal 3
      othersWithSummary[0].should.include 'Africa row over Zuma'
      othersWithSummary[1].should.include 'Violence mars Black Friday'
      othersWithSummary[2].should.include 'Brazilian soldiers of the'

  describe 'other stories', ->

    it 'exports a function', ->
     scraper.others.should.be.type 'function'

    it 'parses the html extracting the other stories', ->
      others = scraper.others()
      others.should.be.instanceOf Array
      scraper.others(3).length.should.equal 3
      scraper.others(6).length.should.equal 6
      scraper.others().length.should.equal 4
