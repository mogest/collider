var React = require('react');
var AtomList = require('./atom_list.js');
var NewAtomForm = require('./new_atom_form.js');
var Link = require('react-router-component').Link;

var Index = React.createClass({
  propTypes: {
    name: React.PropTypes.string,
    atoms: React.PropTypes.array
  },

  render: function() {
    return (
      <div>
        <h1>{this.props.name || "Atom list"}</h1>

        <AtomList atoms={this.props.atoms} />

        <NewAtomForm />
      </div>
    );
  }
});

module.exports = Index;
