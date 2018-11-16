require 'pry'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post[:content] = params[:content]
    @post[:name] = params[:name]
    @post.save
    redirect to "/posts/#{post.id}"
  end

  post '/posts' do
    @post = Post.create(:name => params[:post_name], :content => params[:post_content])
    redirect to '/posts'
  end

  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.destroy
  end

end
