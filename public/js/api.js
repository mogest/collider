var API = {
  getAtoms: function() {
    return new Promise(function(resolve, reject) {
      $.getJSON('/atoms').
        success(function(data) { resolve(data) }).
        fail(reject);
    });
  }
}

module.exports = API;
