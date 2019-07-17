
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    @article = Article.create(params[:student])
    binding.pry
    erb :show
  end
  
  get '/articles' do
    @articles
    
    erb :index
  end
end
