class AtomNumber < ActiveRecord::Base
  belongs_to :account

  def issue_next_number!
    with_lock do
      number = next_number
      update!(next_number: number + 1)
      number
    end
  end
end
