class Question < ActiveRecord::Base
  belongs_to :author, class_name: :User
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :answers

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

  def has_best_answer?
    !(best_answer_id == nil)
  end

end
