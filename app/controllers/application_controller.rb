
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

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/:id' do
      @article = Article.find_by(id:params[:id].to_i)

      erb :show
  end

  post '/articles' do
    @article = Article.new(params)
    
    # binding.pry
    @article.save

    # erb :show
    # binding.pry
    new_url = "/articles/#{@article[:id]}"
    redirect to(new_url)
    # /?#{@article[:id]}'
  end

  get '/articles/:id/edit' do
    # binding.pry
    @article = Article.find_by(id:params[:id].to_i)
    erb :edit
  end
  
  patch '/articles/:id' do
    @article = Article.find_by(id:params[:id].to_i)
    @article.update(title: params[:title], content: params[:content])

    erb :show
  end

  delete '/articles/:id' do
    @article = Article.find_by(id:params[:id].to_i)
    @article.delete

    redirect '/articles'
  end

end
