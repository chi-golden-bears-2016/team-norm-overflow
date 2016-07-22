class Answer < ActiveRecord::Base
  belongs_to :author, class_name: :User
  belongs_to :question
  has_many :votes, as: :voteable
  has_many :comments, as: :commentable
  
  include ActionView::Helpers::DateHelper
  def minutes_ago
    distance_of_time_in_words(Time.now-self.created_at)
  end


  def points
    self.votes.sum("value")
  end
end
