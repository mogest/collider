class Account < ActiveRecord::Base
  has_many :elements, dependent: :destroy
  has_many :fields, dependent: :destroy
  has_many :atoms # will be destroyed by elements
  has_many :users, dependent: :destroy
  has_one :atom_number, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def issue_next_number!
    if atom_number
      atom_number.issue_next_number!
    else
      with_lock do
        if atom_number
          atom_number.issue_next_number!
        else
          AtomNumber.create!(account: self).issue_next_number!
        end
      end
    end
  end
end
