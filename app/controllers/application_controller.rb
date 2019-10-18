
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #index
  get '/' do
    redirect '/articles'
  end
  
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  #create
  get '/articles/new' do
    erb :new
  end
  
  post '/articles/new' do
    @article = Article.create(:title => params[:article][:title], :content => params[:article][:content])
    redirect "articles/#{Article.last.id}"
  end
  
  #Read
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  #Update
  
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{@article.id}"
  end
  
  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
    redirect "/articles"
  end

end
