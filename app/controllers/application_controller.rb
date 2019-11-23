
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new'
  erb :new.erb

  end

  get '/articles/show'
  erb :show.erb
  end
end
