var React = require('react');
var Link = require('react-router-component').Link;
var Loading = require('./loading.js');

var AtomStore = require('../store/atom_store.js')

var _ = require('underscore');

var getAtomState = function(number) {
  return AtomStore.getAtom(number);
}

var ListItemWrapper = React.createClass({
  render: function() {
    return (
      <li className={this.props.class_name}>
        <span className="property-name">{this.props.field_name}</span>
        <span className="property-value">{this.props.value}</span>
      </li>
    );
  }
});

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
          <h2> Could not find number {this.state.number} </h2>
        </div>
      )
    }

    var propertyList = _.map(this.state.properties, function(property){
      var class_name = "property-" + property.field_name;
      return <ListItemWrapper key={property.field_name} class_name={class_name} field_name={property.field_name} value={property.value} />;
    });

    return (
      <div className="atom">
        <h2>{this.state.element.toUpperCase()} ({this.state.number}) {this.state.propertyObject().Title.value}</h2>
        <ul className="property-list">
          { propertyList }

          <li className="property-created_by">
            <span className="property-name">Created by</span>
            <span className="property-value">
              <Link className="user" href={"/user/" + this.state.created_by.email}>{this.state.created_by.preferred_name}</Link>
            </span>
          </li>
        </ul>
      </div>
    );
  }
});

module.exports = AtomPage;
