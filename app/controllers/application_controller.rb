
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #use the complement of all the routes that have id in them
  exclude_routes = %w[articles/new articles]
  before do
    @article = Article.find_by(id: get_id_from_path(request.path_info)) unless exclude_routes.include?(request.path_info)
  end

  get '/articles/new' do 
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id/edit' do
    # @article = Article.find_by(id: params[:id].to_i)
    erb :edit
  end

  patch '/articles/:id' do
    @article.update(article_params(params))
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article.destroy
    redirect to '/articles'
  end


  private
    def article_params(params)
      { :title => params[:title],
        :content => params[:content]
      }
    end

    def get_id_from_path(path)
      #if an edit request than is different than any other request.
      if path.include?("edit")
        path.split('/')[-2].to_i
      else
        path.split('/').last.to_i
      end
    end

end
