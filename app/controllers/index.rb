get '/' do

erb :index
end

post '/urls' do
  Url.create(params[:long_url])
end

get '/:short_url' do
  redirect (Url.find_by_short_url params[:short_url]).long_url
end
