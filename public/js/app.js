var React = require('react');
var Application = require('./components/application.js');

React.render(
  <Application name={"Something"} atoms={[{ number: 1, title: "Cats" }, { number: 2, title: "Dogs" }]} />,
  //<AtomSummary number={1} title={'dog'} />,
  document.getElementById('app')
);
