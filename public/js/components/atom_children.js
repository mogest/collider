var React = require('react');
var Link = require('react-router-component').Link;
var Loading = require('./loading.js');
var AtomLink = require('./atom_link.js');

var AtomStore = require('../store/atom_store.js');

var _ = require('underscore');

var getAtomChildren = function(number) {
  return AtomStore.getAtomChildren(number);
};

var AtomChildren = React.createClass({
  propTypes: {
    number: React.PropTypes.number,
    is_loading: React.PropTypes.bool
  },

  _onChange: function() {
    this.setState(this.getInitialState());
  },

  getInitialState: function() {
    var atomState = getAtomChildren(this.props.number);

    if (atomState) {
      atomState.is_loading = false;
      return atomState;
    } else {
      return {
        is_loading: true
      };
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

    var children_list = _.map(this.state.children, function(child) {
      return (
        <li key={child.number}>
          <AtomLink atom={child} />
        </li>
      );
    });

    if (this.state.children.length == 0) {
      children_list = (
        <i>No children</i>
      );
    }

    return (
      <div className="children-list">
        <h3>Child atoms</h3>

        <ul>
         {children_list}
        </ul>
      </div>
    );
  }
});

module.exports = AtomChildren;
