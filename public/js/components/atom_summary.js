var React = require('react');
var Link = require('react-router-component').Link;

var AtomSummary = React.createClass({
  propTypes: {
    number: React.PropTypes.number,
    title: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
      <Link href={"/atom/" + this.props.number}>
        <div>Number: {this.props.number}</div>
        <div>Title: {this.props.title}</div>
      </Link>
      </div>
    );
  }
});

module.exports = AtomSummary;
