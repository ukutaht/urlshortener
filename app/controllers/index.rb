get '/' do

end

post '/urls' do
  Url.create(params[:long_url])
end

# e.g., /q6bda
get '/:short_url' do
  redirect to (Url.find_by_short_url params[:short_url]).long_url
end
