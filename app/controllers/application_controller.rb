
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
    binding.pry
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  binding.pry
  post '/articles' do
    Article.create(params[:article])
    redirect '/articles/:id'
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    erb :edit
  end

end
