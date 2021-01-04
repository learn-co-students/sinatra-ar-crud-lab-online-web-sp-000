
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  post '/articles' do
    binding.pry
    @article = Article.new
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    @article.id = Article.last.id
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article.title = params[:title]
    @article.content = params[:content]
    @article.update
    erb :show     
  end

  
end
