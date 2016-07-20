get "/sessions/new" do
  erb :"session/new"
end

post "/sessions" do
  email_or_username = params[:user][:email]
  plaintext_password = params[:user][:password]

  if user = User.authenticate(email_or_username, plaintext_password)
    session[:user_id] = user.id
    redirect "/"
  else
    redirect "/sessions/new"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end
