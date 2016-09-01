# Voting on Question
post '/questions/:id/votes' do
 @question = Question.find(params[:id])
 upvote = (params[:upVote] == "true")
 # p [upvote, params[:upVote]]
 @vote = Vote.new(user_id: current_user.id, upvoted?: upvote)
 # @vote.user_id = current_user.id
  if @vote.save
    @question.votes << @vote
    if request.xhr?
      p @question.rating.to_s
    else
     redirect "/questions/#{@question.id}"
    end
  else
    @errors = @vote.errors.full_messages
    erb :"questions/#{@question.id}"
  end
end

# Vote on Answer
post '/questions/:id/answers/:answer_id/votes' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  upvote = (params[:upVote] == "true")
  p [upvote, params[:upVote]]
  @vote = Vote.new(user_id: current_user.id, upvoted?: upvote)
  # @vote.user_id = current_user.id
  if @vote.save
    @answer.votes << @vote
    if request.xhr?
      @answer.rating.to_s
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = @vote.errors.full_messages
    erb :"questions/#{@question.id}"
  end
end

