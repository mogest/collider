class ElementField < ActiveRecord::Base
  belongs_to :element
  belongs_to :field

  validates :element_id, :field_id, presence: true
end
