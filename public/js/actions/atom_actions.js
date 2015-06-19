var AppDispatcher = require('../dispatcher/app_dispatcher');
var API = require('../api.js');

AtomActions = {

  getAtom: function(number) {
    API.getAtom(number).
      then(function(data) {
        AppDispatcher.dispatch({
          actionType: 'addAtom',
          data: data
        });
    }, function(data) {
      if (data.status == 404) {
        AppDispatcher.dispatch({
          actionType: 'addAtom',
          data: {atom: {number: Number.parseInt(number)}}
        });
      } else {
        console.log(data);
      }
    });
  },

  getAtoms: function() {
    API.getAtoms().
      then(function(data) {
        AppDispatcher.dispatch({
          actionType: 'addAtoms',
          data: data
        });
      }, console.log);
  }

};

module.exports = AtomActions;
