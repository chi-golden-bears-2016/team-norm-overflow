class Answer < ActiveRecord::Base
  belongs_to :author, class_name: :User
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
end
