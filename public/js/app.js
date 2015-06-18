var React = require('react');
var Application = require('./components/application.js');
var AtomPage = require('./components/atom_page.js');

var Router = require('react-router-component');
var Locations = Router.Locations;
var Location = Router.Location;

var App = React.createClass({

  render: function() {
    return (
      <Locations>
        <Location path="/" handler={Application} />
        <Location path="/atom/:number" handler={AtomPage} />
      </Locations>
    )
  }
});

React.render(React.createElement(App), document.body);
