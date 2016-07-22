get '/' do
  @logged_in = logged_in?
  @questions = Question.all
    erb :"questions/index"
end