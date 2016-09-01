# Create a new vote
post '/questions/:id/votes' do
 @question = Question.find(params[:id])
 upvote = (params[:upVote] == "true")
 # p [upvote, params[:upVote]]
 @vote = Vote.new(user_id: current_user.id, upvoted?: upvote)
 # @vote.user_id = current_user.id
  if @vote.save
    @question.votes << @vote
    redirect "/questions/#{@question.id}"
  else
    @errors = @vote.errors.full_messages
    erb :"questions/#{@question.id}"
  end
end

# Create a new vote
post '/questions/:id/answers/:answer_id/votes' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  upvote = (params[:upVote] == "true")
  # p [upvote, params[:upVote]]
  @vote = Vote.new(user_id: current_user.id, upvoted?: upvote)
  # @vote.user_id = current_user.id
  if @vote.save
    @answer.votes << @vote
    redirect "/questions/#{@question.id}"
  else
    @errors = @vote.errors.full_messages
    erb :"questions/#{@question.id}"
  end
end

