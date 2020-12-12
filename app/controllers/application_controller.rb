require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @title = params[:title]
    @content = params[:content]
    @articles = Article.create(title: @title, content: @content)
    # binding.pry
    redirect "/articles/#{@articles.id}"
  end   

  get '/articles' do 
    @articles = Article.all

    erb :index
  end 

  get '/articles/:id' do 
    @articles = Article.find(params[:id])

    erb :show
  end 

 get '/articles/:id/edit' do
  @articles = Article.find_by_id(params[:id])
  erb :edit
end

patch '/articles/:id' do
  @articles = Article.find_by_id(params[:id])
  @articles.title = params[:title]
  @articles.content = params[:content]
  @articles.save
  erb :show
end

 delete '/articles/:id' do
   @articles = Article.find_by_id(params[:id])
   @articles.destroy
   redirect "/articles/new"
 end


end
