require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @articles = Article.all
    erb :index
  end


  get '/articles/new' do
    # @article = Article.create(title: params[:title], content: params[:content])
    # binding.pry
    # Article.create(title: params[:title])
    # @title = params[:title]
    # @content = params[:content]
    erb :new
  end


  get '/show' do
    erb :show
  end


post '/articles' do
  @ar =  Article.create(title: params[:title], content: params[:content])
  @ar.save
  # @articles = Article.all


    erb :show

  end

  get '/articles' do
    # binding.pry
      @articles = Article.all
      @title = params[:title]
      @content = params[:content]
      erb :index
  end


  get '/articles/:id' do

 binding.pry
    @article = Article.find(params[:id])
    erb :'/views/show'
  end

get '/articles/:id/edit' do
  erb :edit
end



end
