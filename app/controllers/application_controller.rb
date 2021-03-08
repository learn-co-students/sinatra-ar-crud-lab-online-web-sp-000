
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end
  
  get'/articles' do 
    @articles = Article.all
  erb :index
  end
  
  get '/articles/new' do
    @article = Article.new
  erb :new
  end
  
  post '/articles' do
   
    @article = Article.create(title: params[:title],content: params[:content])
  redirect to "/articles/#{ @article.id }"
  end
  
  get '/articles/:id' do 
    #binding.pry
    @article = Article.find(params[:id])
    erb :show
  end
  
 
  
  
end
