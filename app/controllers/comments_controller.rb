post "/questions/:id/comments" do
  @question = Question.find(params[:id]) #user id and URL
  @comment = Comment.new(params[:comment]) #comment hash from post request
  @comment.user = current_user
  if @comment.save
    @question.comments << @comment  # add comment to comment list
    redirect "/questions/#{id}"
  else
    erb :"comments/new"
  end
end

