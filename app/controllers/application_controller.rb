
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Create
  get '/' do
  end
  
  get '/articles/new' do
  end
  
  post '/articles' do
  end
  
end
