class User < ActiveRecord::Base
  require 'bcrypt'

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

  # has_many :entries

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def User.authenticate(email, plaintext_password)
    user = User.find_by_email(email)

    if user && user.password == plaintext_password
      user
    else
      nil
    end
  end

end
