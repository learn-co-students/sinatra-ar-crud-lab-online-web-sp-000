
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  #index
  get '/articles' do
    @articles = Article.all

    erb :index
  end

  #new
  get '/articles/new' do
    @article = Article.new # instantiate an Article object (but don't save yet)
    erb :new
  end

  #create
  post '/articles' do 
    @article = Article.create(params[:article]) # instantiate and save  

    redirect to "/articles/#{ @article.id }" 
  end

  #show
  get '/articles/:id' do 
    @article = Article.find(params[:id])

    erb :show
  end

  #edit
  get '/articles/:id/edit' do 
    @article = Article.find(params[:id].to_i)

    erb :edit
  end

  #update
  patch '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    @article.update(params[:article])

    redirect to "/articles/#{@article.id}"
  end

  #destroy
  delete '/articles/:id' do 
    # there was no need to put the article into a variable,
    # since we don't need to do anything with it in an erb file
    @article = Article.find(params[:id].to_i) 
    @article.destroy

    redirect to "/articles"
  end
end

# remember to convert params[:id] to integer
