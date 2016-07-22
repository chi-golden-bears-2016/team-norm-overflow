get '/' do
  @logged_in = logged_in?
  @questions = Question.all
  # redirect "/questions"
    erb :"questions/index"

end
