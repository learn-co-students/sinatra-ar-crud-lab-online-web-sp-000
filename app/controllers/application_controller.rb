#2. After the database connection, we have to create in the root directory a file called 'app.rb', that's in which we create a class called 'Application' 
# and make it inherit from 'Sinatra::Base', so that all instances of 'Application' can use all Sinatra features.
#5. create the routes/actions that will distinguish different requests to fire a specific block of code
# where it will use the logic of 'models'
require_relative '../../config/environment'
require 'pry'

# the order in which you define your routes in a controller matters
# So, if we define the get '/articles/:id' route before the 
# get '/articles/new' route, Sinatra would feed all requests for /articles/new to the /articles/:id route
# and we should see an error telling us that our app is unable to find an Article instance with an id of "new".

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do	
    redirect to '/articles'
  end

  get '/articles' do # this action should use Active Record to grab all of the articles and store them in an instance variable.
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do # this action should use Active Record to create a new instance of an Article.
    @article = Article.new
    erb :new
  end

  get '/articles/:id' do # this action should use Active Record to grab the article with the id that is in the params and set it equal to an instance variable.
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do # creates a new article from the params from the form and saves instance in table, then redirects to that new article's show page.
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
