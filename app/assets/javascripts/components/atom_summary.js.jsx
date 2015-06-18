var AtomSummary = React.createClass({
  propTypes: {
    number: React.PropTypes.number,
    title: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Number: {this.props.number}</div>
        <div>Title: {this.props.title}</div>
      </div>
    );
  }
});
