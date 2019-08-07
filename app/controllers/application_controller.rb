
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  erb :index
  end

  get 'articles/:id' do
  end

  get '/articles/new' do
    binding.pry
  erb :new
  end

  post '/articles/' do
  binding.pry
  end


end
