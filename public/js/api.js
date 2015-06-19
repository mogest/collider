var API = {

  getAtom: function(number) {
    return new Promise(function(resolve, reject) {
      $.getJSON('/atoms/' + number).
        success(function(data) { resolve(data); }).
        fail(reject);
    });
  },

  getAtoms: function() {
    return new Promise(function(resolve, reject) {
      $.getJSON('/atoms').
        success(function(data) { resolve(data); }).
        fail(reject);
    });
  },

  getElements: function() {
    return new Promise(function(resolve, reject) {
      $.getJSON('/elements').
        success(function(data) { resolve(data); }).
        fail(reject);
    });
  },

  getAtomChildren: function(number) {
    return new Promise(function(resolve, reject) {
      $.getJSON('/atoms/' + number + "/children").
        success(function(data) { resolve(data); }).
        fail(reject);
    });
  }

};

module.exports = API;
