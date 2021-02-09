#2. After the database connection, we have to create in the root directory a file called 'app.rb', that's in which we create a class called 'Application' 
# and make it inherit from 'Sinatra::Base', so that all instances of 'Application' can use all Sinatra features.
#5. create the routes/actions that will distinguish different requests to fire a specific block of code
# where it will use the logic of 'models'
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do	
    redirect to '/articles'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    #binding.pry
    @article = Article.create(title: params[:title], content: params[:content])
    #binding.pry
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id }"
  end

  delete '/articles/:id' do
    Article.delete(params[:id])
    redirect to "/articles"
  end
end
