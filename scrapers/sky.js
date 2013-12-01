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
    secondary.push($(this).html());
  });
  return secondary;
};

Sky.prototype.tertiary = function() {
  var tertiary = [];
  this.$html.find('#latest_tertiary > article').each(function() {
    tertiary.push($(this).html());
  });
  return tertiary;
};

Sky.prototype.all = function() {
  var all = this.top() + this.secondary() + this.tertiary();
  return all.replace(/[\n\r\t]/g, '').trim();
};

module.exports = Sky;
