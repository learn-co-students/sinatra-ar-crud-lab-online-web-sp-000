
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Hello, World!"
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    new_article = Article.create(params)

    redirect "/articles/#{new_article.id}"
  end

  get '/articles/:id' do
    @new_article = Article.find(params[:id].to_i)

    erb :show
  end
end
