var React = require('react');
var Link = require('react-router-component').Link;
var Loading = require('./loading.js');

var AtomStore = require('../store/atom_store.js')

var _ = require('underscore');

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
    this.setState(this.getInitialState());
  },

  getInitialState: function() {
    var atomState = getAtomState(this.props.number);

    if (atomState) {
      atomState.is_loading = false
      return atomState;
    } else {
      return {is_loading: true }
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
          <h2> Couldn't find number {this.state.number} </h2>
        </div>
      )
    }

    var propertyList = _.map(this.state.properties, function(property){
      var class_name = "property-" + property.field_name;
      return (
        <li className={class_name}>
          <span className="property-name">{property.field_name}</span>
          <span className="property-value">{property.value}</span>
        </li>
      );
    });

    return (
      <div className="atom">
        <h2>{this.state.element.toUpperCase()} ({this.state.number}) {this.state.propertyObject().Title.value}</h2>
        <ul className="property-list">
          { propertyList }
        </ul>
      </div>
    );
  }
});

module.exports = AtomPage;
