var React = require('react');
var Link = require('react-router-component').Link;

module.exports = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    atoms: React.PropTypes.array
  },

  render: function() {
    return (
      <nav>
        <Link href={"/"}>Collider</Link>
      </nav>
    );
  }
});
