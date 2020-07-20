require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

    erb :index
  end

  get '/articles' do
    @articles = Articles.all
    @articles.each do |article|
      article
    end
  erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    a = Article.new
    a.title = params[:title]
    a.content = params[:content]
    a.save
    @article = a

  end


  get '/articles/:id' do
    @article = Article.find(params["id"])
  erb :show
  end

  # get '/articles/show' do
  #   @articles
  
  # end

  

  

 

  get '/articles/:id/edit' do
    @title = params[:id]
 
    edit.erb
  end

end
