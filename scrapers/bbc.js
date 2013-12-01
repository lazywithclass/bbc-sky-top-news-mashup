var $ = require('jquery');

function BBC (html) {
  this.$html = $(html);
}

BBC.prototype.top = function() {
  return this.$html.find('#top-story').html();
};

BBC.prototype.second = function() {
  return this.$html.find('#second-story').html();
};

BBC.prototype.third = function() {
  return this.$html.find('#third-story').html();
};

// seems unlikely but BBC changed how the following elements are shown
// when I first coded this there was a with-summary class, now there's not
// I'm leaving this here in case the reason is different from what I think
BBC.prototype.othersWithSummary = function() {
  var othersWithSummary = [];
  this.$html.find('ul.other-top-stories-stories > li.with-summary').each(function() {
    othersWithSummary.push($(this).html());
  });
  return othersWithSummary;
};

BBC.prototype.others = function(amount) {
  var others = [];
  amount = amount || 7;
  this.$html.find('ul.other-top-stories-stories > li:not(.with-summary) :lt(' + amount + ')').each(function() {
    others.push($(this).html());
  });
  return others;
};

BBC.prototype.all = function() {
  var all = this.top() + this.second() + this.third() + this.others();
  return all.replace(/[\n\r\t]/g, '').trim();
};

module.exports = BBC;
