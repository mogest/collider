var React = require('react');
var Link = require('react-router-component').Link;
var Loading = require('./loading.js');

var AtomPage = React.createClass({
  propTypes: {
    number: React.PropTypes.number,
    title: React.PropTypes.string,
    is_loading: React.PropTypes.bool
  },

  getInitialState: function() {
    return {
      is_loading: true
    };
  },

  componentDidMount: function() {
    $.get("http://localhost:3000/", function (result) {
      if (this.isMounted()) {
        this.setState({
          title: "This is supposed to be dynamic but it's not yet",
          number: this.props.number,      // props is different from state!
          is_loading: false
        });
      }
    }.bind(this));
  },

  render: function() {
    if (this.state.is_loading) {
      return (
        <Loading />
      );
    }

    return (
      <div>
        <h2>I am an atom! {this.state.number} ({this.state.title})</h2>
      </div>
    );
  }
});

module.exports = AtomPage;
