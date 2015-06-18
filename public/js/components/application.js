var React = require('react');
var AtomList = require('./atom_list.js');

var Application = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    atoms: React.PropTypes.array
  },

  render: function() {
    return (
      <div>
        <h1>{this.props.name || "untitled application"}</h1>

        <AtomList atoms={this.props.atoms} />
      </div>
    );
  }
});

module.exports = Application;
