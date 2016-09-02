# get 'question/:id/answers/new' do
#   erb :'answers/new'
# end

post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.new(body: params[:body])
  @answer.user_id = current_user.id
  # @answer.question_id = params[:id]
  if @answer.save
    @question.answers << @answer
    redirect "/questions/#{@question.id}"

  else
    @errors = @answer.errors.full_messages
    erb :"questions/#{@question.id}"
  end
end
