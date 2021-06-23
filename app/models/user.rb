class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validate :valid_email

  def valid_email(user)
    if email[-4..-1] != ".com"
      errors.add :email, "must end in .com"
    elsif !user.email.include?("@")
      user.errors.add :email, "must contain @ symbol."
    end
  end
end
