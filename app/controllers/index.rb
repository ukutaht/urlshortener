get '/' do
 erb :index
end

post '/urls' do
  @url = Url.create(:long_url => params[:long_url])
  if @url.valid?
    redirect to '/?sucess=true'
  else
    redirect to '/?sucess=false'
  end
end

get '/:short_url' do
  redirect (Url.find_by_short_url params[:short_url]).long_url
end
