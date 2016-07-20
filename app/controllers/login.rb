get "/login" do
  erb :"login/index"
end

post "/login" do
  email = params[:user][:email]
  plaintext_password = params[:user][:password]

  if user = User.authenticate(email, plaintext_password)
    session[:user_id] = user.id
    redirect "/"
  else
    redirect "login/index"
  end
end

get "/logout" do
  session[:user_id] = nil
  redirect "/"
end
