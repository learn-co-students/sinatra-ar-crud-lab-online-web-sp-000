
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # create routes ###############################
  get '/articles/new' do
    erb :new
  end
  
  post '/articles' do
    article = Article.new(params)
    article.save  
    redirect "/articles/#{article.id}"
  end


  # read routes ###############################
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  
  get '/articles/:id' do    
    @article = Article.find(params[:id])
    erb :show
  end

  # update routes ###############################
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])    
    erb :edit
  end
  
  patch '/articles/:id' do
    article = Article.find(params[:id])
    # article.update(params[:article])

    params[:article].each do |attr, value|      
      if value != article.send("#{attr}") && value != ""
        article.send(("#{attr}="), value)
      end
    end
    article.save

    redirect "/articles/#{article.id}"
  end
  
  # delete routes ###############################
  delete '/articles/:id' do  
    article = Article.find(params[:id])
    article.destroy
    redirect "/articles"
  end
 
end
