def is_best_answer?(answer)
  answer.question.best_answer_id == answer.id
end

def is_my_question?(answer)
  logged_in? && current_user.id == answer.author_id
end