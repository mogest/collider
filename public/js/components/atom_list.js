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
      return (
        <AtomSummary key={result.number} atom={result} />
      );
    });

    return (
      <table className="atom-list">
        <thead>
          <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Created by</th>
          </tr>
        </thead>
        <tbody>
          {items}
        </tbody>
      </table>
    );
  }
});

module.exports = AtomList;
