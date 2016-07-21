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
  @question = Question.find(params[:id])
  erb :"questions/show"
end

post "/questions" do
  params[:question][:author_id] = session[:user_id]
  @question = Question.create(params[:question])
  redirect "/questions/#{@question.id}"
end
