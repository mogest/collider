class AtomSerializer
  attr_reader :atom

  def initialize(atom)
    @atom = atom
  end

  def to_json
    attributes.to_json
  end

  protected

  def attributes
    {
      atom: {
        element: atom.element.name,
        parent_atom_number: atom.parent_atom.try!(:number),
        properties: property_attributes,
        created_at: atom.created_at
      }
    }
  end

  def property_attributes
    atom.properties.live.preload(:field).map do |property|
      {
        field_id: property.field_id,
        field_name: property.field.name,
        field_type: property.field.field_type,
        value: property.value,
        created_at: property.created_at
      }
    end
  end
end
