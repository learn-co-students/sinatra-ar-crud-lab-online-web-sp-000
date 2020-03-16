
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
    @articles = Article.all

  end

  get '/articles/new' do 
    #binding.pry 

    erb :new
  end 

  post '/articles' do 
    #@article = Article.create(title: params[:title], content: params[:content])
    @article = Article.new
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save

    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id' do 
    @article = Article.find(params[:id])

    erb :show
  end 
  

end
