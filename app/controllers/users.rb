before do
  @errors = []
end

get "/users/index" do
  erb :"users/index"
end

get "/users/new" do
  erb :'/users/new'
end

post "/users" do
  @user = User.create(params[:user])


  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n"
  puts params[:thumb].class


  @user.avatar = params[:thumb]
  @user.save!
  if @user.errors.any?
    @errors << @user.errors.full_messages
    erb :'/users/new'
  else
    session[:user_id] = @user.id
    # redirect "/"
  end
end

get "/users/not_authorized" do
  erb :"/users/not_authorized"
end

get "/users/:id" do
  @user = User.find(params[:id])
  erb :"users/show"
end

get "/users/edit/:id" do
  @user = User.find(params[:id])
  redirect "users/not_authorized" if current_user != @user
  erb :"users/edit"
end

put "/users/:id" do
  @user = User.find(params[:id])
  redirect "users/not_authorized" if current_user != @user
  @user.update_attributes(params[:user])
  redirect "users/#{@user.id}"
end

delete "/users/:id" do
  @user = User.find(params[:id])
  redirect "users/not_authorized" if current_user != @user
  @user.destroy
  redirect "/logout"
end