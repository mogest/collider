class AtomsSerializer
  attr_reader :atoms

  def initialize(atoms)
    @atoms = atoms
  end

  def to_struct
    attributes.map {|object| Structy.new(object)}
  end

  def to_json
    attributes.to_json
  end

  def attributes
    # TODO : super budget, super slow!
    atoms.map {|atom| AtomSerializer.new(atom).send(:attributes)}
  end
end
