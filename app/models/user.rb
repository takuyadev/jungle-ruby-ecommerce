class User < ApplicationRecord
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    # Check email is associated with email
    trim_email = email&.strip&.downcase
    user = User.find_by_email(trim_email)

    if (!user)
      return nil
    end

    # Check if user password matches
    if (!user.authenticate(password))
      return nil
    end

    return user
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: { scope: :email,
                                  message: "should be unique email" }
  validates :password, length: { minimum: 6 }, presence: true
end
