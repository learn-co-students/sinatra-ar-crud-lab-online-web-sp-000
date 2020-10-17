
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    erb :show
  end

  get '/articles/:id' do 
    article[:id] = params[:id]
    @article = article
    @id = @article[:id]
    # @article = params[:id]
    erb :show
  end

  get '/articles/:id/edit' do
    erb :edit
  end  

  patch '/articles/:id' do
    erb :edit
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete
    erb :index
  end

end
