enable :sessions

get '/signup' do
  erb :signup
end

post '/signup' do

  #create user
  user = User.create(name: params[:name], password: params[:password], email: params[:email])
  session[:valid_user] = true
  session[:user_id] = user.id
  redirect "/"
end

get "/signin" do
  erb :signin
end

post '/signin' do
  # Look in app/views/index.erb

  if user_id = User.authenticate(params[:email], params[:password])
    session[:valid_user] = true
    session[:user_id] = user_id
    # puts "valid User" + session[:valid_user].to_s
    redirect "/"
  else
    session[:valid_user] = false
    session[:user_id] = 0
    # puts "valid User" + session[:valid_user].to_s
    redirect "/signin"
  end
end

get '/logout' do
  # Look in app/views/index.erb
  session[:valid_user] = false
  session[:user_id] = 0
  redirect '/'
end
