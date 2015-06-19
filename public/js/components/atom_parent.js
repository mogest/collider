var React = require('react');
var Link = require('react-router-component').Link;
var Loading = require('./loading.js');
var AtomParent = require('./atom_parent.js');

var AtomStore = require('../store/atom_store.js');

var _ = require('underscore');

var getAtomState = function(number) {
  return AtomStore.getAtom(number);
};

var AtomParent = React.createClass({
  propTypes: {
    number: React.PropTypes.number,
    title: React.PropTypes.string,
    is_loading: React.PropTypes.bool
  },

  _onChange: function() {
    this.setState(this.getInitialState());
  },

  getInitialState: function() {
    var atomState = getAtomState(this.props.number);

    if (atomState) {
      atomState.is_loading = false;
      return atomState;
    } else {
      return {is_loading: true };
    }
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

    if (!this.state.valid) {
      return (
        <div>
          <h2> Could not find number {this.state.number} </h2>
        </div>
      )
    }

    var parent = this.state.parent_atom_number ? (
      <AtomParent number={this.state.parent_atom_number} />
    ) : "";

    return (
      <div className="parent">
        {parent}
        <Link href={"/atom/" + this.state.number}>
          {this.state.element.toUpperCase()} #{this.state.number} - {this.state.propertyObject().Title.value}
        </Link>
      </div>
    );
  }
});

module.exports = AtomParent;
