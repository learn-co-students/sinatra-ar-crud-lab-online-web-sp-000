
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    #shows list of all articles
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    #form to create a new article
    erb :new
  end 

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    #this params doesnt come from a form but from the url itself
    #params doesnt always mean form!
    if !@article 
      "page not found"
    else
      erb :show
    end
  end


  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    #create will call methods new and save.
    #tip: u could just pass the whole params, it will take only the relevant pieces
    
    redirect to "/articles/#{@article.id}"
    #WARNING: if u use single quotes ' ' here it fails!
  end

  get '/articles/:id/edit' do 
    #from the id, figure out the article and send article to views
    #this is needed not just for displaying old data about to be changed,
    #but also so we know which address to POST to
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  patch '/articles/:id' do  
    @article = Article.find_by(id: params[:id])
    @article.update(title: params[:title], content: params[:content])
    #looks like we can't pass just the params as a whole
    #my guess is the update method want exactly what it needs, it wont except irrelevant stuff

    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.destroy
  end
  
end
