var React = require('react');
var AtomList = require('./atom_list.js');
var AtomStore = require('../store/atom_store.js');
var Link = require('react-router-component').Link;
var Loading = require('./loading.js');
var Navigatable = require('react-router-component').NavigatableMixin;

var NewAtomForm = React.createClass({
  mixins: [Navigatable],

  _onChange: function() {
    this.setState(this.getInitialState());
  },

  getInitialState: function() {
    var elements = AtomStore.getElements();

    if (elements.length) {
      return {elements: elements, loading: false};
    } else {
      return {loading: true};
    }
  },

  componentDidMount: function() {
    AtomStore.addChangeListener(this._onChange);
  },

  componentWillUnmount: function() {
    AtomStore.removeChangeListener(this._onChange);
  },

  onsubmit: function(e) {
    e.preventDefault();
    var value = this.refs.elements.getDOMNode().value;
    this.navigate("/atom/new/" + value);
  },

  render: function() {
    if (this.state.loading) {
      return (
        <Loading />
      );
    }

    var options = this.state.elements.map(function(element) {
      return <option key={element.id} value={element.id}>{element.name}</option>;
    });

    return (
      <form onSubmit={this.onsubmit}>
        <p>
          Create a new
          <select ref="elements">
            {options}
          </select>
          <input type="submit" value="Create" />
        </p>
      </form>
    );
  }
});

module.exports = NewAtomForm;

