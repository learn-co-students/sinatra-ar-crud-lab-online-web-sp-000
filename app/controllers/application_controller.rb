
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do # root directory 
  end

  get '/articles' do
    # This action should use active record to grab all of the articles and store them in an instance var @articles.
    # Then, it should render to the index.erb view. That view should use ERB to iterate over @articles.

    erb :index
  end

  get '/articles/new' do
    # This view will be a blank form that should submit a POST request to /articles 
    
    erb :new
  end

  get '/articles/:id' do
    # This action should use active record to grab the article with the id that is in the params and set it equal to @article.
    # Then is should render to the show.erb view page. That view should use ERB to render the @articles title and content.

    erb :show
  end

  post '/articles' do 
    # create a new article from the pramas from the form, then redirects that to new articles show page

    erb :show
  end 



  
  
end
