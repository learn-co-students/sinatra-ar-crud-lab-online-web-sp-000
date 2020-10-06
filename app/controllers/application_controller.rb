require_relative "../../config/environment"
require "pry"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/articles" do
    @articles = Article.all
    erb :index
  end

  get "/articles/new" do
    erb :new
  end

  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])

    erb :edit
  end

  patch "/articles/:id/edit" do #ask: why did I have to add the /edit onto the end of this route since sinatra told me to do so in the browser?
    @article = Article.find(params[:id])
    @article.title = params[:title] #does this take the title they pass in in current time from params?
    @article.content = params[:content] #does this take the content they pass in in current time from params?
    @article.save

    redirect to "/articles/#{@article.id}"
  end

  delete "/articles/:id" do
    @article = Article.find(params[:id])
    @article.destroy

    redirect to "/articles"
  end
end
