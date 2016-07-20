User.delete_all
# Question.delete_all
# Answer.delete_all
# Comment.delete_all
# Vote.delete_all

100.times do
	User.create(
		username: Faker::Internet.user_name,
		password: Faker::Internet.password,
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name
		)
end