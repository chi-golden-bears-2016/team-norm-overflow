class Comment < ActiveRecord::Base
  belongs_to :author, class_name: :User
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true

  include ActionView::Helpers::DateHelper
  def minutes_ago
    distance_of_time_in_words(Time.now-self.created_at)
  end

  def points
    self.votes.sum("value")
  end

end
