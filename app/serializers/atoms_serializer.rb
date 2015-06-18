class AtomsSerializer
  attr_reader :atoms

  def initialize(atoms)
    @atoms = atoms
  end

  def to_json
    attributes.to_json
  end

  protected

  def attributes
    # TODO : super budget, super slow!
    {atoms: atoms.map {|atom| AtomSerializer.new(atom).send(:attributes)}}
  end
end
