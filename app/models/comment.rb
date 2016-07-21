class Comment < ActiveRecord::Base
  belongs_to :author, class_name: :User
  has_many :votes, as: :voteable
  belongs_to :commentable, polymorphic: true

  def minutes_ago
    ((Time.now-self.created_at) / 60).floor
  end

end
