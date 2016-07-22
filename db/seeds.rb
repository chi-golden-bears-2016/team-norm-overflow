User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

100.times do
	User.create(
		username: Faker::Internet.user_name,
		password: Faker::Internet.password,
		email: Faker::Internet.email,
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		)
end

100.times do
	Question.create(
		author_id:User.all.shuffle[0].id,
		title: Faker::Hipster.sentence.chop + "?",
		body: Faker::Lorem.paragraph
		)
end

500.times do
	Answer.create(
		question_id: Question.all.shuffle[0].id,
		author_id: User.all.shuffle[0].id,
		body: Faker::Hacker.say_something_smart
		)
end

200.times do
	Comment.create(
		author_id: User.all.shuffle[0].id,
		body: Faker::Company.catch_phrase,
		commentable_type: "Question",
		commentable_id:Question.all.shuffle[0].id
		)
end

200.times do
	Comment.create(
		author_id: User.all.shuffle[0].id,
		body: Faker::StarWars.quote,
		commentable_type: "Answer",
		commentable_id:Answer.all.shuffle[0].id
		)
end

200.times do
	Vote.create(
		voter_id: User.all.shuffle[0].id,
		voteable_type: "Question",
		voteable_id:Question.all.shuffle[0].id,
		value: rand(-1..1)
		)
end

200.times do
	Vote.create(
		voter_id: User.all.shuffle[0].id,
		voteable_type: "Answer",
		voteable_id:Answer.all.shuffle[0].id,
		value: rand(-1..1)
		)
end

200.times do
	Vote.create(
		voter_id: User.all.shuffle[0].id,
		voteable_type: "Comment",
		voteable_id:Comment.all.shuffle[0].id,
		value: rand(-1..1)
		)
end
