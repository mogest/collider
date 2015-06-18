var assign = require('object-assign');

function Atom(data) {
  assign(this, data);

  // Invert the properties array and store as an object keyed by field_name
  this.properties = {};
  data.properties.forEach(function(property) {
    this.properties[property.field_name] = property;
  }.bind(this));

}

module.exports = Atom;
