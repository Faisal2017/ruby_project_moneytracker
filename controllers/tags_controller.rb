require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag.rb')

get '/tags' do
  @tags = Tag.all()
  erb (:"tags/index")
end

get '/tags/new' do
  @tags = Tag.all()
  erb(:"tags/new")
end

post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect to ('/tags')
end

post '/tags/:id/delete' do
  Tag.destroy(params[:id])
  redirect to("/tags")
end

get "/tags/:id" do
  @tag = Tag.find(params[:id].to_i())
  erb(:"tags/show")
end 