
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

  get '/articles/:id/edit' do
    # binding.pry
    @article=Article.find(params[:id])
    erb :edit
  end

  get '/articles/:id' do
    # binding.pry
    @article=Article.find(params[:id])
    erb :show
  end

  patch '/articles/:id' do
    # binding.pry
    @article=Article.find(params[:id])
    @article.title=params[:title]
    @article.content=params[:content]
    @article.save
    erb :show
  end

  delete '/articles/:id' do
    # binding.pry
    Article.find(params[:id]).delete
    # @article.title=params[:title]
    # @article.content=params[:content]
    # @article.save
    redirect to "/articles"
  end

  post '/articles' do
    article=Article.create(:title => params[:title], :content => params[:content])
    redirect to "/articles/#{article.id}"
  end

end
