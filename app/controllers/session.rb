get "/sessions/new" do
  erb :"session/new"
end

post "/sessions" do
  email_or_username = params[:user][:email_or_username]
  plaintext_password = params[:user][:password]

  if user = User.authenticate(email_or_username, plaintext_password)
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = ["Please check you log in credentials"]
    redirect "/sessions/new"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end
