
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  # home page definition ###############################
  get '/' do
    redirect "/articles"
  end


  # create routes ###############################
  # new
  get '/articles/new' do
    erb :new
  end
  
  # create
  post '/articles' do
    article = Article.new(params)
    article.save  
    redirect "/articles/#{article.id}"
  end


  # read routes ###############################
  # index
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  # show
  get '/articles/:id' do    
    @article = Article.find(params[:id])
    erb :show
  end


  # update routes ###############################
  # edit
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])    
    erb :edit
  end
  
  # update
  patch '/articles/:id' do
    article = Article.find(params[:id])
    
    # school and my original solution - will update everything no matter the inputs
    # article.update(params[:article])

    # my final solution - only updates if input is different from existing data and input is not left blank
        # allows for selective updating - can leave input blank if don't want change
    params[:article].each do |attr, value|      
      if value != article.send("#{attr}") && value != ""
        article.send(("#{attr}="), value)
      end
    end
    article.save

    redirect "/articles/#{article.id}"
  end
  

  # delete routes ###############################
  # destroy
  delete '/articles/:id' do  
    # original solution - not wrong, just not as concise
    # article = Article.find(params[:id])
    # article.destroy
    
    # school solution - same thing but in one line
    Article.destroy(params[:id])
    redirect "/articles"
  end 
end
