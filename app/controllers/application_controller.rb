
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    article = Article.create(title: params[:title], content: params[:content])
    #binding.pry
    redirect "/articles/#{article.id}"
  end

  # uses active record to grab ALL the articles & store them
  # in an instance variable @articles. then render index.erb
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # uses active record to grab the article with the id that is
  # in the params and set it equal to @article, render show.erb
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #view should contain a a form to update a specific article
  # fields shold be pre-populated with existing title and content
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy
  end
end
