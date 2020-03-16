
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  post '/articles' do 
    @articles = Article.all 
    @article = Article.create(title: params[:title], content: params[:content])
    
    erb :new
  end
  
  get '/articles/new' do 
    #binding.pry 
   
    erb :new
  end 

  # post '/articles/:id' do 
  #   Article = Article.find(params[:id])
  #   erb :show
  # end 
end
