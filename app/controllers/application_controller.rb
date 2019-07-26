
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles/new' do #renders form to create new article
    erb :new
  end

  post '/articles' do #creates new article
    @article = Article.create(:title => params[:title], :content => params[:content])
    redirect to "/articles/#{@article.id}"
  end

  get '/articles' do #renders all articles
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do #renders individual article
    @article = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do  #renders form to edit file
    @article = Article.find_by_id(params[:id])
    erb :edit
  end

  patch '/articles/:id' do #edits article
    @article = Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    redirect to "/articles/#{@article.id}"
  end

  delete '/articles/:id/delete' do #deletes article
    @article = Article.find_by_id(params[:id])
    @article.delete
    redirect to '/articles'
  end

end
