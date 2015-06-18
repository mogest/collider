class Element < ActiveRecord::Base
  has_many :atoms, dependent: :destroy
  has_many :element_fields, dependent: :destroy
  has_many :fields, through: :element_fields
end
