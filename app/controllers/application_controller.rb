
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get "/articles/new" do
    erb :new
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  get "/articles" do
    @articles = Articles.all
    erb :index
  end

  delete '/articles/:id' do

  end

  patch "/articles/:id" do

  end

  post "/articles" do

  end
end
