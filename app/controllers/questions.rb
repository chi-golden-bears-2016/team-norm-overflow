require 'json'
get "/questions"  do
  @logged_in = logged_in?
  @questions = Question.all
  erb :"questions/index"
end

get "/questions/new" do
  if !logged_in?
    redirect "/sessions/new"
  else
    erb :"questions/new"
  end
end

get "/questions/:id" do
  @logged_in = logged_in?
  @question = Question.find(params[:id])
  erb :"questions/show"
end

post "/questions" do
  @question = Question.create(
    title: params[:title],
    body: params[:body],
    author_id: session[:user_id]
    )
  redirect "/questions/#{@question.id}"
end

post "/questions/:id/answers" do
  if request.xhr?
    @answer= Answer.create(
      body: params[:answer_body],
      author_id: session[:user_id],
      question_id: params[:id])
    erb :"answers/show", layout:false, locals:{answer:@answer}
  else
    @answer= Answer.create(
      body: params[:body],
      author_id: session[:user_id],
      question_id: params[:id])
    redirect "/questions/#{params[:id]}"
  end
end

post '/questions/:id/comments/new' do
  @question = Question.find(params[:id])
  @comment = @question.comments.create(
    body: params[:body],
    author_id: session[:user_id]
   )
  if request.xhr?
    content_type "json"
    return_json = [@comment, @comment.author].to_json
  else
    redirect "/questions/#{params[:id]}##{@comment.id}"
  end
end

post '/questions/:q_id/best_answers/:a_id' do
  @question = Question.find(params[:q_id])
  @question.best_answer_id = params[:a_id]
  @question.save!
  if request.xhr?
    status 200
  else
    redirect "/questions/#{params[:q_id]}"
  end
end
