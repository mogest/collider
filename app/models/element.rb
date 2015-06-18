class Element < ActiveRecord::Base
  belongs_to :account
  has_many :atoms, dependent: :destroy
  has_many :element_fields, dependent: :destroy
  has_many :fields, through: :element_fields

  #validates :account, presence: true, uniqueness: {scope: :account_id}
end
