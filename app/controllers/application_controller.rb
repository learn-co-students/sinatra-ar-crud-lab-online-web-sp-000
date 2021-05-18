
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
      redirect to "/articles"
  end

#read
  get "/articles" do
      @articles = Article.all
      erb :index
  end

  get "/articles/:id" do
      @article = Article.find(params[:id])
      erb :show
  end
#new
    get "/articles/new" do
        @article = Article.find(params[:id])
        erb :new
    end
#create
    post "/articles" do
        @article = Article.new(params)
        redirect to "articles/#{@article.id}"
    end
end
