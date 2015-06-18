var React = require('react');
var Link = require('react-router-component').Link;
var Loading = require('./loading.js');

var AtomStore = require('../store/atom_store.js')

var getAtomState = function(number) {
  return AtomStore.getAtom(number);
}

var AtomPage = React.createClass({
  propTypes: {
    number: React.PropTypes.number,
    title: React.PropTypes.string,
    is_loading: React.PropTypes.bool
  },

  _onChange: function() {
    this.setState(getInitialState());
  },

  getInitialState: function() {
    var atomState = getAtomState(this.props.number);
    console.log(atomState)
    atomState.is_loading = !(atomState);

    return atomState;
  },

  componentDidMount: function() {
    AtomStore.addChangeListener(this._onChange);
  },

  componentWillUnmount: function() {
    AtomStore.removeChangeListener(this._onChange);
  },

  render: function() {
    if (this.state.is_loading) {
      return (
        <Loading />
      );
    }

    return (
      <div>
        <h2>{this.state.element.toUpperCase()} I am an atom! {this.state.number} ({this.state.properties.Title.value})</h2>
      </div>
    );
  }
});

module.exports = AtomPage;
