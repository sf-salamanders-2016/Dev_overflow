get '/questions' do
  @questions = Question.order(:created_at)
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions"
<<<<<<< HEAD
    #we can also redirect to questions/id
=======
>>>>>>> 23fe122726308086ccd2ec7e0098d627f8e1b224
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

<<<<<<< HEAD

#If we decide to create individual question pages: 
=======
#If we decide to create individual question pages:
>>>>>>> 23fe122726308086ccd2ec7e0098d627f8e1b224
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'question/show' #or individual boiler plate
end

get '/questions/:id/edit' do
  @user = User.find(params[:display_name])
  @question = Question.find(params[:id])
  erb :'question/edit' #or question/edit page boiler plate
end

post '/questions/:id' do
  @user = User.find(params[:display_name])
  @question = Question.find(params[:id])
  @question.update_attributes(params[:question])
  redirect "/questions/#{@question.id}"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @question.destroy
  redirect '/questions'
end
