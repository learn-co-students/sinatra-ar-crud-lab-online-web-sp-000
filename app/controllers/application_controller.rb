
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "hello"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find {|a| a.id == params[:id].to_i}
    erb :show
  end

  post '/articles' do
    @article = Article.create(params[:article])
    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find {|a| a.id==params[:id].to_i}
    erb :edit
  end

  patch '/articles/:id' do
    @old_a = Article.find {|a| a.id==params[:id].to_i}
    @old_a.name = params[:name]
    @old_a.content= params[:content]
    @old_a.save

    redirect "/articles/#{@article.id}"
  end
end
