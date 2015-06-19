var React = require('react');
var Link = require('react-router-component').Link;

var AtomSummary = React.createClass({
  propTypes: {
    atom: React.PropTypes.object
  },

  render: function() {
    return (
      <tr>
        <td>
          <Link href={"/atom/" + this.props.atom.number}>#{this.props.atom.number}</Link>
        </td>
        <td>
          <Link href={"/atom/" + this.props.atom.number}>{this.props.atom.propertyObject().Title.value}</Link>
        </td>
        <td>
          <Link className="user" href={"/user/" + this.props.atom.created_by.email}>{this.props.atom.created_by.preferred_name}</Link>
        </td>
      </tr>
    );
  }
});

module.exports = AtomSummary;
