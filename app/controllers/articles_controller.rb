class ArticlesController < ApplicationController

  get '/articles' do
    "does it swim"
    # This action should use active record to grab all of the articles and store them in an instance var @articles.
    #   # Then, it should render to the index.erb view. That view should use ERB to iterate over @articles.
    erb :index
  end

end
