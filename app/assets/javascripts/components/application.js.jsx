var Application = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    atoms: React.PropTypes.array
  },

  render: function() {
    return (
      <div>
        <h1>{this.props.name}</h1>

        <AtomList atoms={this.props.atoms} />
      </div>
    );
  }
});
