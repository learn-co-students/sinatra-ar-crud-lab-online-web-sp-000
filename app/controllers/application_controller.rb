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

    Article.create(title: params[:title], content: params[:content])
    @title = params[:title]
    @content = params[:content]

    erb :index
  end


  get '/articles/:id' do
    # binding.pry
    @article = Article.find(params[:id])
    erb :show
  end

get '/articles/:id/edit' do
  erb :edit
end



end
