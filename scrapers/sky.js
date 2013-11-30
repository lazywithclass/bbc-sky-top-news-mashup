var $ = require('jquery');

module.exports.top = function(html) {
  return $(html).find('#latest_supermain_hero').html();
};

module.exports.secondary = function(html) {
  var secondary = [];
  $(html).find('#latest_secondary > article').each(function() {
    secondary.push($(this).html().replace(/[\n\r\t]/g, '').trim());
  });
  return secondary;
};

module.exports.tertiary = function(html) {
  var tertiary = [];
  $(html).find('#latest_tertiary > article').each(function() {
    tertiary.push($(this).html().replace(/[\n\r\t]/g, '').trim());
  });
  return tertiary;
};
