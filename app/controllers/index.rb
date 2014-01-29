require 'uri'

get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  # create a new Url
  if params[:long_url] =~ URI::regexp
    Url.create(long_url: params[:long_url])
  else
    redirect '/'
  end
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  url = Url.find_by(short_url: params[:short_url] )
  url.click_count = url.click_count + 1
  url.save
  redirect url.long_url
end
