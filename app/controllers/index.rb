get '/' do
  @questions = Question.all
  redirect "/questions"
end
