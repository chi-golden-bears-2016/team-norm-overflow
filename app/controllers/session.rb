before do
  @errors = []
end

get "/sessions/new" do
  erb :"sessions/new"
end

post "/sessions" do
  email_or_username = params[:user][:email_or_username]
  plaintext_password = params[:user][:password]

  if user = User.authenticate(email_or_username, plaintext_password)
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = ["Please check your log in credentials"]
    erb :"sessions/new"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end
