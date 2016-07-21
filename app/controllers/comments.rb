get "/comments" do
  @comments = Comment.all
  erb :"comments/index"
end
