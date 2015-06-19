var assign = require('object-assign');

function Atom(data) {
  assign(this, data);

  this.valid = !!(data.properties);

  if (this.valid) {
    // Invert the properties array and return an object keyed by field_name
    this.propertyObject = function() {
      var properties = {};
      data.properties.forEach(function(property) {
        properties[property.field_name] = property;
      });
      return properties;
    }
  }

}

module.exports = Atom;
