
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.new(params)

    #url = "/articles/" + @article.title
    @article.id = Article.where("title == ?", params[:title]).id

    #redirect "/articles/:id"

    #Model.create(some_attribute: params[:some_attribute])
  end



  get '/articles/:id' do
    @article = Article.fetch_value(:id)
    #@id = @article.primary_key
    erb :show
  end

end
