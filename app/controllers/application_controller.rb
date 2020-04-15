
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  # The controller action should use the Create CRUD action to create the article and save it to the database.
  get '/articles/new' do
    @article = Article.new(params)
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    # binding.pry
    @article.save

    redirect "/articles/#{@article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    # binding.pry
    @article.save

    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id/delete' do
    @article = Article.find(params[:id])
    @article.destroy

    redirect "/articles"
  end

end
