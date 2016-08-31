User.create(display_name: "Max Musterman", email: "max.musterman@gmail.com", password: "123")
Question.create(user_id: 1, title: "title", question: "what?")
Answer.create(user_id: 1, question_id: 1, body: "thats a stupid question")
Vote.create(votable_id: 1, votable_type: "Answer", user_id: 1, up?: true)
