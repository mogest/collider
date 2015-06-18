var AppDispatcher = require('../dispatcher/app_dispatcher.js');
var EventEmitter = require('events').EventEmitter;
var assign = require('object-assign');
var _ = require('underscore');

var Atom = require('./atom.js');

var _atoms = [];

var CHANGE = 'atoms_changed'

var AtomStore = assign({}, EventEmitter.prototype, {

  getAll: function() {
    return _atoms;
  },

  getAtom: function(number) {
    var result = _.findWhere(_atoms, {number: Number.parseInt(number)});
    console.log(result)
    return result || {};
  },

  addAtom: function(data) {
    _atoms.push(new Atom(data));
  },

  emitChange: function() {
    this.emit(CHANGE);
  },

  addChangeListener: function(callback) {
    this.on(CHANGE, callback);
  },

  removeChangeListener: function(callback) {
    this.removeListener(CHANGE, callback);
  },

  dispatcherIndex: AppDispatcher.register(function(action) {

    console.log(action)

    switch(action.actionType) {
      case 'addAtoms':
        action.data.atoms.forEach(function(atomData){
          AtomStore.addAtom(atomData);
        });
        AtomStore.emitChange();
        break;
    }

    return true;
  })

});

module.exports = AtomStore;
