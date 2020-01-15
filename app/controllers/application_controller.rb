
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/new' do 
    erb :new
  end
  
  post '/articles' do 
    @article = Article.new(params)
    @id = params[:id]
    @title = params[:title]
    @content = params[:content]
    erb :show    
  end
  
  get '/articles' do 
    erb :index
  end
  
  get '/articles/:id' do 
    @id = params["id"]
    @article = @artcles[@id]
    erb :show
  end
  
  
  
end
