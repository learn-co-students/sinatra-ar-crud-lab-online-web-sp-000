
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #index
  get '/articles' do 
    @articles = Article.all
    erb :index
  end

  #new
  get '/articles/new' do 
    erb :new
  end

  #create
  post '/articles' do 
    @article = Article.create(title: params[:article][:title], content: params[:article][:content])
    redirect to "/articles/#{@article.id}"
  end

  #get by id
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show
  end

  #edit
  get '/articles/:id/edit' do 
    @article = Article.find_by(id: params[:id])    
    erb :edit
  end

  #update
  patch '/articles/:id' do 
    @article = Article.find_by(id: params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  #delete
  delete "/articles/:id" do
    @article = Article.destroy(params[:id])
    redirect to "/articles"
    #add form that submits a delete request
  end

end