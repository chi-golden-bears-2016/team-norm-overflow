class Question < ActiveRecord::Base
  belongs_to :author, class_name: :User
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  has_many :answers



  def points
    self.votes.sum("value")
  end

  def answer_count
    self.answers.length
  end

  def view_count
    self.views
  end

  include ActionView::Helpers::DateHelper
  def minutes_ago
    distance_of_time_in_words(Time.now-self.created_at)
  end

  def has_best_answer?
    !(best_answer_id == nil)
  end

end
