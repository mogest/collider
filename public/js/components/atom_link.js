var React = require('react');
var Link = require('react-router-component').Link;
var Loading = require('./loading.js');

var _ = require('underscore');

var getAtomState = function(number) {
  return AtomStore.getAtom(number);
};

var AtomLink = React.createClass({
  propTypes: {
    atom: React.PropTypes.object
  },

  render: function() {
    return (
      <Link href={"/atom/" + this.props.atom.number}>
        {this.props.atom.element.toUpperCase()} #{this.props.atom.number} - {this.props.atom.propertyObject().Title.value}
      </Link>
    );
  }
});

module.exports = AtomLink;
