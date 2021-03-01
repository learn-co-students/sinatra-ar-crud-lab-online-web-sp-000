
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :new
  end

  get '/articles/new' do 
    @articles = Article.create(params[:title], params[:content])
    erb :new
  end

  post '/articles' do 
    attrs = params
    @article = Article.create(attrs) 
  end

  get '/articles' do 
    @articles = Article.article_title
    erb :index 
  end

  get '/articles/:id' do
  @article = Article.find_by(params[:id])

  erb :show 

  post '/articles'
end

end
