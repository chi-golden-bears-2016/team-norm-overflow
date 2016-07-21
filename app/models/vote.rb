class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: :User
  belongs_to :voteable, polymorphic: true

validates :voter, uniqueness: {scope: [:voteable, :voteable_type]}

  def self.votes_exist?(voter_id, voteable_type, voteable_id)
    # voteable_type.gsub(/'/)
    if vote = Vote.where("voter_id=? AND voteable_id= ? AND voteable_type=?", voter_id, voteable_id, voteable_type).first
        vote
    else
      false
    end
  end

end
