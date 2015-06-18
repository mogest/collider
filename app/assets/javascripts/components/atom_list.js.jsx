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
