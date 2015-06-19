class PopulateAtom
  attr_reader :atom, :errors, :user, :update_time

  def initialize(atom, params, user:)
    @incoming_atom = atom
    @params = params
    @user = user
  end

  def call
    @atom = construct_atom
    @update_time = Time.now

    atom.with_lock do
      if !atom.update(construct_atom_attribs)
        @errors = atom.errors
        return false
      end

      @errors = ActiveModel::Errors.new(atom)

      populate_properties

      return true if errors.empty?
      raise ActiveRecord::Rollback
    end

    false
  end

  protected

  def params
    @params
  end

  def construct_atom
    @incoming_atom || account.atoms.new(new_atom_attribs)
  end

  def new_atom_attribs
    {
      number: account.issue_next_number!,
      created_by_user: user
    }
  end

  def construct_atom_attribs
    output = params.slice("element_id")

    if number = params["parent_atom_number"]
      if parent_atom = account.atoms.where(number: number).first
        output["parent_atom_id"] = parent_atom.id
      else
        output["parent_atom_id"] = 0 # will create a validation error
      end
    end

    output
  end

  def populate_properties
    existing_properties = atom.properties.live.preload(:field)
    fields = atom.element.fields
    acceptable_field_ids = fields.map(&:id).to_set

    properties_params.each do |field_id, value|
      existing_property = existing_properties.detect {|property| property.field_id == field_id}

      if !acceptable_field_ids.include?(field_id)
        errors.add(:base, "Field ID #{field_id} is not valid")
        next
      end

      property = atom.properties.new(
        field_id: field_id,
        parent_property: existing_property,
        value: value,
        created_at: update_time,
        created_by_user: user
      )

      if !property.save
        property.errors.messages.each do |attribute, message|
          errors.add("Property with field ID #{field_id} attribute #{attribute}", message)
        end
      end

      if existing_property
        existing_property.update!(obsolete_at: update_time)
      end
    end
  end

  def properties_params
    params["properties"].to_h
  end

  def account
    user.account
  end
end
