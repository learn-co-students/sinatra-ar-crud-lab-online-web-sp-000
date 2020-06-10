
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/models/new' do
    erb :new
  end 

  post '/models' do 
    binding.pry
    variable = params[:some_attribute]
    Article.create(title:, content:)

end
