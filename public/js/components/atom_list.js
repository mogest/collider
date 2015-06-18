var React = require('react');
var AtomSummary = require('./atom_summary');

var AtomStore = require('../store/atom_store.js')

var getAtoms = function() {
  return {atoms: AtomStore.getAll() }
}

var AtomList = React.createClass({
  propTypes: {
    atoms: React.PropTypes.array
  },

  _onChange: function() {
    this.setState(this.getInitialState());
  },

  getInitialState: function() {
    return getAtoms();
  },

  componentDidMount: function() {
    AtomStore.addChangeListener(this._onChange);
  },

  componentWillUnmount: function() {
    AtomStore.removeChangeListener(this._onChange);
  },

  render: function() {
    var items = this.state.atoms.map(function(result) {
      console.log(result)
      return <AtomSummary number={result.number} title={result.properties.Title.value} />
    });

    return (
      <ul>
        {items}
      </ul>
    );
  }
});

module.exports = AtomList;
