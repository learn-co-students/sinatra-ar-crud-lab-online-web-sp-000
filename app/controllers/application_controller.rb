require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do

    @article = Article.find(params[:id])
    # binding.pry
    erb :show

  end
  get '/articles/:id/edit' do

    @article = Article.find(params[:id])
    # binding.pry
    erb :edit

  end
  patch "/articles/:id" do

    @article = Article.find(params[:id])
    @article.update(params[:article])
    # binding.pry
    redirect to "/articles/#{ @article.id }"
  end

  post '/articles' do
    @article = Article.create(params)
    #  binding.pry
    redirect to "articles/#{@article.id}"
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
  end
end
