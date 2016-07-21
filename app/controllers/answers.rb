post '/answers/:id/comments/new' do
  @answer = Answer.find(params[:id])
  @comment = @answer.comments.create(
    body: params[:body],
    author_id: session[:user_id]
   )
  if request.xhr?
    content_type "json"
    return_json = [@comment, @comment.author].to_json
  else
    redirect "/answers/#{params[:id]}##{@comment.id}"
  end
end

