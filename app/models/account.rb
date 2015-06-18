class Account < ActiveRecord::Base
  has_many :elements, dependent: :destroy
  has_many :fields, dependent: :destroy
  has_many :atoms, through: :elements
end
