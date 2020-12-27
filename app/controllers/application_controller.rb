
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :makeArticle
  end

  post '/created' do
    newArticle = Article.new(title: params[:title], content: params[:content])
    get '/articles/#{newArticle.id}'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    found = false
    @articles = Article.all
    @articles.each do | selected |
      if (selected.id == params[:id])
        found = true
        @chosen = selected
        erb :show
      end
    end
    if (found == false)
      "Error, no matching ID found"
    end
  end


end
