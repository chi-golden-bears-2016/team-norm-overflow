post "/votes/:voteable_type/:id" do
  if Vote.votes_exist?(session[:user_id], params[:voteable_type], params[:id])
    "not authorized"
  else
    vote = Vote.create(value: params[:vote], voter_id: session[:user_id], voteable_type:params[:voteable_type], voteable_id: params[:id])
    # redirect "/questions/?#{params[:return_URL]}"
  end

  if params[:voteable_type] == "Question"
    redirect "/questions/#{params[:id]}"
  elsif params[:voteable_type] == "Answer"
     question_id= Answer.find(params[:id]).question_id
    redirect "/questions/#{question_id}"
  else
    question_or_answer = Comment.find(params[:id]).commentable
      if question_or_answer.is_a?(Question)
        redirect "/questions/#{question_or_answer.id}"
      else
        redirect "/questions/#{question_or_answer.question_id}"
      end
  end
end
