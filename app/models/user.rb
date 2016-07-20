class User < ActiveRecord::Base
  require 'bcrypt'

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :questions, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id
  has_many :answer_votes, through: :answers, source: :votable

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
