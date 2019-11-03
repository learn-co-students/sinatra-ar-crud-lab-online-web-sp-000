require './config/environment'

class ApplicationController < Sinatra::Base

  get '/articles/new' do
    erb :new
  end
