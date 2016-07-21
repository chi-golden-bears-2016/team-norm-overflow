get "/questions"  do
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
  @answer= Answer.create(
    body: params[:body],
    author_id: session[:user_id],
    question_id: params[:id])
  redirect "/questions/#{params[:id]}"
end
