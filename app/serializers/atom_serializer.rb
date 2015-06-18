class AtomSerializer
  attr_reader :atom

  def initialize(atom)
    @atom = atom
  end

  def to_json
    attributes.to_json
  end

  def to_struct
    Structy.new(attributes)
  end

  def attributes
    {
      number: atom.number,
      element: atom.element.name,
      parent_atom_number: atom.parent_atom.try!(:number),
      properties: property_attributes,
      created_at: atom.created_at
    }
  end

  protected

  def property_attributes
    properties = atom.properties.live.index_by(&:field_id)

    atom.element.fields.map do |field|
      property = properties[field.id]

      {
        field_id: field.id,
        field_name: field.name,
        field_type: field.field_type,
        value: property.try!(:value),
        value_set_at: property.try!(:created_at)
      }
    end
  end
end
