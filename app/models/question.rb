class Question < ActiveRecord::Base
  belongs_to :author, class_name: :User
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :author, class_name: :User
end
