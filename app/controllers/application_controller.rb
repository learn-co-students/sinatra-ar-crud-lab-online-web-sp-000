
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do #creates
    @post = Post.create(params)
    # binding.pry
    redirect to '/posts'
  end

  get '/posts' do #load
    # binding.pry
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do  #load show.erb
    @post = Post.find_by_id(params[:id])
    # binding.pry
    erb :show
  end

  get '/posts/:id/edit' do  #load edit.erb
    @post = Post.find_by_id(params[:id])
    erb :edit
  end

  patch '/posts/:id' do  #update
    @post = Post.find_by_id(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end
end
