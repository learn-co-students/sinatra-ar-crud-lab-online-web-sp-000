
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do 
    erb :new
  end

  post '/articles' do 
    attrs = params
    @article = Article.create(attrs) 
    redirect "/articles/#{@article.id}"
  end

  get '/articles' do 
    @articles = Article.all
    erb :index 
  end

  get '/articles/:id' do
  @article = Article.find_by(params[:id])

  erb :show 

  post '/articles'
end

end
