get '/tags' do
  # @tags = Tag.all.to_a.sort_by(&:posts.length)
   @tags = Tag.all
   @tags = @tags.sort {|x,y| y.posts.length <=> x.posts.length}
  erb :'/tags/index'
end

get '/tags/new' do
  erb :'/tags/new'
end

post '/tags' do
  tag = Tag.new(params[:tag])
  if tag.save
    redirect "/tags/#{tag.id}"
  else
    @errors = tag.errors.full_messages
    erb :'/tags/new'
  end
end

get '/tags/:id' do
  @tag = Tag.find(params[:id])
  @posts = @tag.posts
  erb :'/tags/show'
end
