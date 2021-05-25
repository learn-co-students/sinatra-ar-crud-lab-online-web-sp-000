
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
      redirect to "/articles"
  end
  get "/articles/new" do
      @article = Article.new
      erb :new
  end
#read
#user starts here; opening page; shows all and every article
  get "/articles" do
      @articles = Article.all
      erb :index
  end
#new

#create; once this controller creates a new article based on the params of user input
#it will redirect to the controller below: "get "/articles/:id" do" in order to render the
#"show" erb page.
    post "/articles" do
        @article = Article.create(params)
        redirect to "/articles/#{@article.id}"
    end
#read
  get "/articles/:id" do
      @article = Article.find(params[:id])
      erb :show
  end

#edit
    get '/articles/:id/edit' do
      @article = Article.find(params[:id])
      erb :edit
    end

    patch '/articles/:id' do
        @article = Article.find_by_id(params[:id])
        @article.update(params[:article])
        redirect to "/articles/#{@article.id}"
    end

    delete '/articles/:id' do
        @article = Article.find(params[:id])
        @article.destroy
        redirect to "/articles"
    end
    
end
