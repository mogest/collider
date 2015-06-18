class Atom < ActiveRecord::Base
  belongs_to :element
  belongs_to :account
  belongs_to :parent_atom, class_name: "Atom"
  belongs_to :created_by_user, class_name: "User"
  has_many :properties, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :element_id, presence: true
  validates :number, presence: true, uniqueness: {scope: :account_id}

  validate :element_belongs_to_account
  validate :parent_atom_belongs_to_account

  protected

  def element_belongs_to_account
    if element_id && account_id && (element.nil? || element.account_id != account_id)
      errors.add(:element_id, "does not belong to account")
    end
  end

  def parent_atom_belongs_to_account
    if parent_atom_id && account_id && (parent_atom.nil? || parent_atom.account_id != account_id)
      errors.add(:parent_atom_id, "does not belong to the same account")
    end
  end
end
