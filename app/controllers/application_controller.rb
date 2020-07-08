
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :articles
  end

  get '/articles' do
    @articles = Article.all
    
    erb :'articles'
  end

  post '/articles' do
    #binding.pry
    @article = Article.new(params)
    @article.save

    redirect to "/articles/#{@article.id}"
  end

  get '/articles/new' do
    
    erb :new

  end



  get '/articles/:id' do
    @article = Article.find(params[:id])
    #binding.pry
    erb :show
    
  end
  
  patch '/articles/:id' do
    #binding.pry
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])

    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :update
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete
    erb :delete
  end

end
