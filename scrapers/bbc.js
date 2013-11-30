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

BBC.prototype.othersWithSummary = function() {
  var othersWithSummary = [];
  this.$html.find('ul.other-top-stories-stories > li.with-summary').each(function() {
    othersWithSummary.push($(this).html().replace(/[\n\r\t]/g, '').trim());
  });
  return othersWithSummary;
};

BBC.prototype.others = function(amount) {
  var others = [];
  amount = amount || 4;
  this.$html.find('ul.other-top-stories-stories > li:not(.with-summary) :lt(' + amount + ')').each(function() {
    others.push($(this).html().replace(/[\n\r\t]/g, '').trim());
  });
  return others;
};

module.exports = BBC;
