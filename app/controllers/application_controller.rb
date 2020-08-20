
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end
  
  #index (read all)
  get '/articles' do 
    @articles = Article.all
    erb :index
  end
  
  #new (get user data to create/post)
  get '/articles/new' do
    erb :new
  end
  
  #show (read #)
  get '/articles/:id' do
    @article=Article.find(params[:id])
    erb :show
  end

  #create (create w/user input)
  post '/articles' do
    @article=Article.create(title:params[:title], content:params[:content])
    redirect "/articles/#{@article.id}"
  end

  #edit (find # and make change)
  get '/articles/:id/edit' do
    @article=Article.find(params[:id])
    erb :edit
  end
  
  #update (use change to update exsiting instance)
  patch '/articles/:id' do
    @article=Article.find(params[:id])
    @article.update(title:params[:title], content:params[:content])
    redirect to "/articles/#{@article.id}"
  end
  
  #distroy
  delete '/articles/:id' do
    @article=Article.find(params[:id])
    @article.destroy
    @articles=Article.all

    erb :index
  end


end
