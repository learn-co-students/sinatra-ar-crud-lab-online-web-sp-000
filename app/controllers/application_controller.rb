
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end


  # the form
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    a = Article.create(params)
    a.save
    redirect to "/articles/#{a.id}"
  end
 #all the instnaces of a class
  get '/articles' do
    @articles = Article.all

    erb :index
  end

 #handles an instance of Artciles
  get '/articles/:id' do
    @articles = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
   @articles = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
   @articles = Article.find_by_id(params[:id])
   @articles.title = params[:title]
   @articles.content = params[:content]
   @articles.save
    erb :show
  end

  delete '/articles/:id' do
    @articles = Article.find_by_id(params[:id])
    @articles.destroy
    redirect to "/articles"
  end




end
