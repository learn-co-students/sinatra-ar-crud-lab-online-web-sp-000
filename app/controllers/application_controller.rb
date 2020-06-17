
require_relative '../../config/environment'
require'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
  @articles = Article.all
    erb :index
  end

get "/articles/new" do 
  @article= Article.new
  erb :new
end

post "/articles" do 
  binding.pry
 @article= Article.new(params)
redirect "/articles/#{@article.id}"
end

  get '/articles/:id' do 
   @article = Article.find(params["id"])
   
  end 

 

end
