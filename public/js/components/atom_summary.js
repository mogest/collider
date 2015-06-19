var React = require('react');
var Link = require('react-router-component').Link;

var AtomSummary = React.createClass({
  propTypes: {
    number: React.PropTypes.number,
    title: React.PropTypes.string
  },

  render: function() {
    return (
      <tr>
        <td>
          <Link href={"/atom/" + this.props.number}>#{this.props.number}</Link>
        </td>
        <td>
          <Link href={"/atom/" + this.props.number}>#{this.props.title}</Link>
        </td>
      </tr>
    );
  }
});

module.exports = AtomSummary;
