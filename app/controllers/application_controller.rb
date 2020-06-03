
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    puts @articles

    erb :index
  end  

  get '/articles/new' do
    erb :new
  end   
  
  post '/articles' do
    @article = Article.find_or_create_by(title: params[:title], content: params[:content])
    
    redirect to "/articles/#{@article.id}"
  end 

  get '/articles/:id' do
    @article = Article.find(params[:id])
    puts @article

    erb :show
  end  

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end  

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(:title => params[:title])
    @article.update(:content => params[:content])
    @article.save

    erb :show
  end 
  
  delete '/articles/:id' do
    @article = Article.all.find(params[:id])

    @article.destroy
    #Article.destroy(params[:id])

    redirect to "/articles"
  end 
  
end
