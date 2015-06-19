var React = require('react');

var Application = require('./components/application.js');
var AtomPage = require('./components/atom_page.js');
var AtomActions = require('./actions/atom_actions.js');
var Header = require('./components/header.js');
var Footer = require('./components/footer.js');

var Router = require('react-router-component');
var Locations = Router.Locations;
var Location = Router.Location;

var App = React.createClass({

  render: function() {
    return (
      <div className="root">
        <Header />
        <Locations>
          <Location path="/" handler={Application} />
          <Location path="/atom/:number" handler={AtomPage} />
        </Locations>
        <Footer />
      </div>
    )
  }
});

React.render(React.createElement(App), document.body);

AtomActions.getAtoms();
