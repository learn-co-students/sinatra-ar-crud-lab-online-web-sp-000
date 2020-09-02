
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do #display all
    @articles = Article.all 
    erb :index
  end 

  get '/articles/new' do #create start
    erb :new
  end 

  patch '/articles/:id' do #edit end
    @article = Article.find(params[:id])
    hash = {title: params[:title], content: params[:content]}
    @article.update(hash) 
    erb :show
  end

  get '/articles/:id/edit' do #edit start
    @article = Article.find(params[:id])
    erb :edit
  end

  get '/articles/:id' do ###show end
    @article = Article.find(params[:id])
    erb :show
  end 

  post '/articles' do #create end
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end 

  delete '/articles/:id' do
    Article.find(params[:id]).delete
    @articles = Article.all
    erb :index
  end 

  
  

end
