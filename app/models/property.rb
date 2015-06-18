class Property < ActiveRecord::Base
  belongs_to :atom
  belongs_to :field
  belongs_to :parent_property, class_name: "Property"
  belongs_to :created_by_user, class_name: "User"

  scope :live, -> { where(obsolete_at: nil) }

  validates :atom_id, :field_id, presence: true

  def self.structify
    all.each_with_object(OpenStruct.new) do |property, result|
      result[property.field.name.underscore] = property
    end
  end

  def value
    send(value_field_in_use) if field
  end

  def value=(data)
    send("#{value_field_in_use}=", data) if field
  end

  def value_field_in_use
    "#{field.data_type}_value" if field
  end
end
