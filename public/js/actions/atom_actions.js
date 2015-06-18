var AppDispatcher = require('../dispatcher/app_dispatcher');
var API = require('../api.js');

AtomActions = {

  getAtoms: function() {
    API.getAtoms().
      then(function(data) {
        AppDispatcher.dispatch({
          actionType: 'addAtoms',
          data: data
        });
      }, console.log)
  }

};

module.exports = AtomActions;
