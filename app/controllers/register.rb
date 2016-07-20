get '/register' do
  erb :"/register/index"
end

post "/register" do
  @user = User.create!(params[:user])
  session[:user_id] = @user.id
  redirect "/"
end
