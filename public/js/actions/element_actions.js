var AppDispatcher = require('../dispatcher/app_dispatcher');
var API = require('../api.js');

ElementActions = {
  getElements: function() {
    API.getElements().
      then(function(data) {
        AppDispatcher.dispatch({
          actionType: 'addElements',
          data: data
        });
      }, console.log);
  }
};

module.exports = ElementActions;

