
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  # main index route (displays all the article titles)
  get "/articles" do
    @articles = Article.all
    erb :index
  end

  # new article route
  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  # create a new article route
  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  # show the article
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  # edit article route
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  # update the article route
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  # delete a article route
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


end
