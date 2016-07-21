get '/' do
  @questions = Question.all
  # redirect "/questions"
    erb :"questions/index"

end
