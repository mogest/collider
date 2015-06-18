class User < ActiveRecord::Base
  belongs_to :account

  before_validation :generate_token
  validates :account_id, presence: true

  protected

  def generate_token
    self.token ||= SecureRandom.hex
  end
end
