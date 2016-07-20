get "/users/index" do
  erb :"users/index"
end

get "/users/:id" do
  @user = User.find(params[:id])
  redirect "users/not_authorized" if current_user != @user
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
