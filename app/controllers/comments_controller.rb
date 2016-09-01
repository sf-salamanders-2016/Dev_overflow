post "/questions/:id/comments" do
  @question = Question.find(params[:id]) #user id and URL
  @comment = Comment.new(body: params[:body]) #comment hash from post request
  @comment.user = current_user
  if @comment.save
    @question.comments << @comment  # add comment to comment list
    redirect "/questions/#{@question.id}"
  else
    erb :"comments/new"
  end
end

post "/questions/:id/answers/:answer_id/comments" do
  @question = Question.find(params[:id]) #user id and URL
  @answer = Answer.find(params[:answer_id]) #user id and URL
  @comment = Comment.new(body: params[:body]) #comment hash from post request
  @comment.user = current_user
  if @comment.save
    @answer.comments << @comment  # add comment to comment list
    redirect "/questions/#{@question.id}"
  else
    erb :"comments/new"
  end
end

