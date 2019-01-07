
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
    @article = Article.new
    @article.title = params['title']
    @article.content = params['content']
    @article.save

    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article1 = Article.find(params[:id])

    erb :show
  end

  get "/articles" do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id/edit' do
    @article2 = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @id = params[:id]
    @update_article = Article.find(@id)
    @update_article.update(title: params[:title], content: params[:content])

    redirect "/articles/#{@id}"
  end

  delete '/articles/:id' do
    Article.all.find(params[:id]).destroy
  end

end
