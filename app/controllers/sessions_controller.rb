get '/sessions-viewer' do
  session.inspect
end

get '/sessions/new' do
  erb :'users/login'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user.password == params[:password]
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect '/'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end
