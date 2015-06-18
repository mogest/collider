var React = require('react');
var AtomSummary = require('./atom_summary');
var AtomList = React.createClass({
  propTypes: {
    atoms: React.PropTypes.array
  },

  render: function() {
    var items = this.props.atoms.map(function(result) {
      return <AtomSummary number={result.number} title={result.title} />
    });

    return (
      <ul>
        {items}
      </ul>
    );
  }
});

module.exports = AtomList;
