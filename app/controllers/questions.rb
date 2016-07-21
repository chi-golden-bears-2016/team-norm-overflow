get "/questions"  do
  @questions = Question.all
  erb :"questions/index"
end

get "/questions/new" do
  unless logged_in?
    redirect "/sessions/new"
  end
    erb :"questions/new"
end

post "/questions" do
  params[:question][:author_id] = session[:user_id]
  @question = Question.create(params[:question])
  redirect "/questions/#{@question.id}"
end
