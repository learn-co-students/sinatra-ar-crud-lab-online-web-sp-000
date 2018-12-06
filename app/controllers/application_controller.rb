
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/posts/new' do
    erb :new
  end
  
  get '/posts' do
    @posts = Post.all
    erb :index
  end
  
  post '/posts' do
    Post.create(name: params[:name], content: params[:content])
    erb :index
  end
  
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end
  
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end
  
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    Post.delete(params[:id].to_i)
    erb :delete
  end
end
