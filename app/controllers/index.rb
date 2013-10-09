get '/' do
 erb :index
end

post '/urls' do
  @url = Url.create(:long_url => params[:long_url])
  if @url.valid?
    redirect to "/?flash=success&short_url=" + @url.short_url
  else
    redirect to "/?flash=error"
  end
end

get '/:short_url' do
  redirect (Url.find_by_short_url params[:short_url]).long_url
end
