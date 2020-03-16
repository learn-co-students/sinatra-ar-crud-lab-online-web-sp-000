
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  # end

  get '/articles/new' do 
    #binding.pry 
   
    erb :new
  end 

  post '/articles' do 

    @article = Article.create(title: params[:title], content: params[:title])

    erb :show 
  end 
end
