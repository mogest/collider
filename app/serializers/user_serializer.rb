class UserSerializer
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def to_json
    attributes.to_json
  end

  def to_struct
    Structy.new(attributes)
  end

  def attributes
    {
      id: user.id,
      name: user.name,
      preferred_name: user.preferred_name,
      email: user.email,
      created_at: user.created_at
    }
  end
end
