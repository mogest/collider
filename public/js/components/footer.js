var React = require('react');

module.exports = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    atoms: React.PropTypes.array
  },

  render: function() {
    return (
      <footer>
        by Powershop
      </footer>
    );
  }
});
