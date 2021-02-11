
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get "/boards" do 
    @boards = Board.all
    erb :index
  end 

  get '/boards/new' do 
    @boards = Board.new
    erb :new 
  end 

  post '/boards' do 
    # raise params.inspect
    @board = Board.create(params)
    redirect to "/boards/#{ @board.id }"
  end 

  get '/boards/:id' do
    @board = Board.find(params[:id])
    erb :show
  end 

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end 

  patch '/articles/:id' do 
    id = params[:id]
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end 
    
  delete '/articles/:id' do 
     Article.destroy(params[:id])
     redirect to '/articles'
    end 
end
