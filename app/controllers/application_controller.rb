
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    id = params[:id].to_i
    @article = Article.all.find {|a| a.id == id}
    erb :show
  end

  post '/articles' do
    @article = Article.create(title: params[:title],content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  patch '/articles/:id' do
    id = params[:id].to_i
    @article = Article.all.find {|a| a.id == id}
    @article.update(title: params[:title],content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    id = params[:id].to_i
    @article = Article.all.find {|a| a.id == id}
    erb :edit
  end

  delete 'articles/:id' do
    binding.pry
    redirect "/"
  end




end
