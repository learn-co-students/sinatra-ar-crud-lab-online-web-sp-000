
require_relative '../../config/environment'
require_relative '../models/article.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    
    erb :index
  end

  get '/articles/new' do

    erb :new
  end

  post '/articles' do
    article = Article.create(title: params[:title],content: params[:content])

    redirect to "/articles/#{article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end


  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
     @updated_article = Article.update(params[:id], title: params[:title], content: params[:content])
     @updated_article.save
     redirect to "/articles/#{@updated_article.id}"
  end


  delete '/articles/:id' do
    Article.delete(params[:id])
    redirect to "/articles"
  end

end
