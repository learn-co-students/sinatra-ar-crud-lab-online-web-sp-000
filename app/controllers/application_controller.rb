
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/articles/new' do

    erb :'articles/new'

  end

  post '/articles' do

    @created_article = Article.create(title: params[:title], content: params[:content])

    redirect to "/articles/#{@created_article.id}"

  end


  get '/articles' do

    @articles = Article.all
    erb :'articles/index'
  end

  get '/articles/:id' do

    @article = Article.find(params[:id])

    erb :'articles/show'

  end


  get '/articles/:id/edit' do

    erb :'articles/edit'

  end


  patch '/articles/:id' do

    @article = Article.find(params[:id])
    @article.save

    redirect to "/articles/#{@article.id}"

  end


  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.delete

    redirect to "/articles"

  end


end
