class Answer < ActiveRecord::Base
  belongs_to :author, class_name: :User
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  def minutes_ago
    ((Time.now-self.created_at) / 60).floor
  end


  def points
    self.votes.sum("value")
  end
end
