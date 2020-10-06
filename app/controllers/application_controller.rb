require_relative "../../config/environment"
require "pry"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/articles" do
    @articles = Article.all
    erb :articles
  end

  get "/articles/new" do
    render :new
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  post "/articles" do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end
end
