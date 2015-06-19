var AppDispatcher = require('../dispatcher/app_dispatcher.js');
var EventEmitter = require('events').EventEmitter;
var assign = require('object-assign');
var ElementActions = require('../actions/element_actions.js');
var _ = require('underscore');

var Atom = require('./atom.js');

var _atoms = [];
var _elements = [];
var CHANGE = 'atoms_changed'

var AtomStore = assign({}, EventEmitter.prototype, {

  getAll: function() {
    return _.filter(_atoms, function(atom) { return atom.valid });
  },

  getAtom: function(number) {
    var result = _.findWhere(_atoms, {number: Number.parseInt(number)});

    if (!result) {
      AtomActions.getAtom(number);
    }

    return result;
  },

  getElements: function() {
    if (_elements.length == 0) {
      ElementActions.getElements();
    }

    return _elements;
  },

  addAtom: function(data) {
    _atoms.push(new Atom(data));
  },

  setElements: function(data) {
    _elements = data;
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
    switch(action.actionType) {
      case 'addAtoms':
        action.data.atoms.forEach(function(atomData){
          AtomStore.addAtom(atomData);
        });
        AtomStore.emitChange();
        break;

      case 'addAtom':
        AtomStore.addAtom(action.data.atom);
        AtomStore.emitChange();
        break;

      case 'addElements':
        AtomStore.setElements(action.data.elements);
        AtomStore.emitChange();
        break;
    }

    return true;
  })

});

module.exports = AtomStore;
