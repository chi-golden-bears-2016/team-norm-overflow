require 'json'
post "/votes/:voteable_type/:id" do

  if Vote.votes_exist?(session[:user_id], params[:voteable_type], params[:id])
    "not authorized"
    "not authorized"
  else
    vote = Vote.create(value: params[:vote], voter_id: session[:user_id], voteable_type:params[:voteable_type], voteable_id: params[:id])
  end

  if request.xhr?
    content_type :json
    {voteable_type: vote.voteable.class.to_s.downcase, voteable_id: vote.voteable.id, points: vote.voteable.points}.to_json
  else
    redirect back
  end
<<<<<<< HEAD
end
=======

end
>>>>>>> 227215a13aef7ec1f6e5da9be2fbb110e7a31e55
