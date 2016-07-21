class User < ActiveRecord::Base
  require 'bcrypt'
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader  
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :questions, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id
  # has_many :answer_votes, through: :answers, source: :votable

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def User.authenticate(email_or_username, plaintext_password)
    user = User.find_by_email(email_or_username) || User.find_by_username(email_or_username)

    if user && user.password == plaintext_password
      user
    else
      nil
    end
  end

  def question_count
    self.questions.count
  end

  def answer_count
    self.answers.count
  end

  def vote_count
    self.votes.count
  end
end