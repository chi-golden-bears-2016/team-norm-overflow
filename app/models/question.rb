class Question < ActiveRecord::Base
  belongs_to :author, class_name: :User
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :answers
  belongs_to :author, class_name: :User

  def vote_count
    self.votes.length
  end

  def answer_count
    self.answers.length
  end

  def view_count
    0
  end

  def minutes_ago
    ((Time.now-self.created_at) / 60).floor
  end

end
