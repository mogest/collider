class API {
  getAtoms() {
    return new Promise(function(resolve, reject) {
      $.getJSON('/atoms').
        success(function(data) { resolve(data) }).
        fail(reject);
    });
  }
}
