var React = require('react');
var Link = require('react-router-component').Link;

var AtomPage = React.createClass({
  propTypes: {
    number: React.PropTypes.number
  },

  render: function() {
    return (
      <div>
        <h2>I am an atom! {this.props.number}</h2>
      </div>
    );
  }
});

module.exports = AtomPage;
