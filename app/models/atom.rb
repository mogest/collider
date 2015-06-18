class Atom < ActiveRecord::Base
  belongs_to :element
  belongs_to :account
  belongs_to :parent_atom, class_name: "Atom"
  belongs_to :created_by_user, class_name: "User"
  has_many :comments, dependent: :destroy

  validates :element_id, presence: true
  validates :number, presence: true, uniqueness: {scope: :account_id}
end
