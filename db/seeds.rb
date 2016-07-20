User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

10.times do
	User.create(
		username: Faker::Internet.user_name,
		password: Faker::Internet.password,
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name
		)
end

100.times do
	Question.create(
		author_id:User.take.id,
		title: Faker::Hipster.sentence + "?",
		body: Faker::Lorem.paragraph
		)
end

500.times do
	Answer.create(
		question_id: Question.take.id,
		author_id: User.take.id,
		body: Faker::Hacker.say_something_smart
		)
end

200.times do
	Comment.create(
		author_id: User.take.id,
		body: Faker::Company.catch_phrase,
		commentable_type: "Question",
		commentable_id:Question.take.id
		)
end

200.times do
	Comment.create(
		author_id: User.take.id,
		body: Faker::StarWars.quote,
		commentable_type: "Answer",
		commentable_id:Answer.take.id
		)
end

200.times do
	Vote.create(
		voter_id: User.take.id,
		voteable_type: "Question",
		voteable_id:Question.take.id,
		value: rand(-1..1)
		)
end

200.times do
	Vote.create(
		voter_id: User.take.id,
		voteable_type: "Answer",
		voteable_id:Answer.take.id,
		value: rand(-1..1)
		)
end

200.times do
	Vote.create(
		voter_id: User.take.id,
		voteable_type: "Comment",
		voteable_id:Comment.take.id,
		value: rand(-1..1)
		)
end