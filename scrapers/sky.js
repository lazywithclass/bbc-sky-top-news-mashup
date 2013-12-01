var $ = require('jquery');

function Sky (html) {
  this.$html = $(html);
}

Sky.prototype.top = function() {
  return this.$html.find('#latest_supermain_hero').html();
};

Sky.prototype.secondary = function() {
  var secondary = [];
  this.$html.find('#latest_secondary > article').each(function() {
    secondary.push($(this).html().replace(/[\n\r\t]/g, '').trim());
  });
  return secondary;
};

Sky.prototype.tertiary = function() {
  var tertiary = [];
  this.$html.find('#latest_tertiary > article').each(function() {
    tertiary.push($(this).html().replace(/[\n\r\t]/g, '').trim());
  });
  return tertiary;
};

Sky.prototype.complete = function() {
  return this.top() + this.secondary() + this.tertiary();
};

module.exports = Sky;
