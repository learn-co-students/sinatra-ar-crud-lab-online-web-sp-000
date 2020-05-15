
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
    @articles=Article.create(title:params[:title], content:params[:content])
    redirect "/articles/#{@articles.id}"
  end

  get '/articles' do
    @articles=Article.all
    erb :index
  end

  get '/articles/:id' do 
    @articles=Article.find_by_id(params[:id])
    #@title=articles.title
    #@article=articles.content
    erb :show
   end

  get '/articles/:id/edit' do
    @articles=Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @articles=Article.find(params[:id])
    @articles.update(params[:article])
    @articles.save
    redirect "/articles/#{@articles.id}"
   end

   delete '/articles/:id' do
    @articles=Article.find_by_id(params[:id])
    @articles.destroy
    redirect '/articles'
   end



 
end
