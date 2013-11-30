var $ = require('jquery');

module.exports.top = function(html) {
  return $(html).find('#top-story').html();
};

module.exports.second = function(html) {
  return $(html).find('#second-story').html();
};

module.exports.third = function(html) {
  return $(html).find('#third-story').html();
};

module.exports.othersWithSummary = function(html) {
  var othersWithSummary = [];
  // map isn't working
  $(html).find('ul.other-top-stories-stories > li.with-summary').each(function() {
    othersWithSummary.push($(this).html().replace(/[\n\r\t]/g, '').trim());
  });
  return othersWithSummary;
};

module.exports.others = function(html, amount) {
  var others = [];
  amount = amount || 4;
  // map isn't working
  $(html).find('ul.other-top-stories-stories > li:not(.with-summary) :lt(' + amount + ')').each(function() {
    others.push($(this).html().replace(/[\n\r\t]/g, '').trim());
  });
  return others;
};

