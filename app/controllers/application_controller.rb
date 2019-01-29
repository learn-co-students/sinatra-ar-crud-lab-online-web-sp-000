
require_relative '../../config/environment'
require_relative '../.models/article.rb'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  post '/articles' do 
    article = Article.new
    article.create(title: params[:title], content: params[:content])
    
  
  get '/articles/new' do
    erb :new
  end
end
