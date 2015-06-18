var Element = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    createdAt: React.PropTypes.node
  },

  render: function() {
    return (
      <div>
        <div>Name: {this.props.name}</div>
        <div>Created At: {this.props.created_at}</div>
        <Element name="hello" />
      </div>
    );
  }
});
