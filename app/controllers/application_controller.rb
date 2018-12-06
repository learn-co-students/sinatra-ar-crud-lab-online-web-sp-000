
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/posts/new' do
    erb :new
  end
  
  post '/posts' do
    Post.create(name: params[:post][:name], content: params[:post][:content])
    erb :index
  end
end
