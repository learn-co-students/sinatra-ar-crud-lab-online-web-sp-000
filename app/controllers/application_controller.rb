
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do # root directory
  end

  get '/articles' do
    @articles = Article.all

    erb :index
  end

  get '/articles/new' do
    # This view will be a blank form that should submit a POST request to /articles
    erb :new
  end

  post '/articles' do
    # create a new article from the pramas from the form, then redirects that to new articles show page
    @article = Article.new
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save

    redirect "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    # This action should use active record to grab the article with the id that is in the params and set it equal to @article.
    # Then is should render to the show.erb view page. That view should use ERB to render the @articles title and content.
    erb :show
  end

  get '/articles/:id/edit' do
    # his view should contain a form to update a specific article--similar to the form you made for a new article,
    # but the fields should be pre-populated with the existing title and content of the article.
    @article = Article.find(params[:id])
    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save

    redirect "/articles/#{@article.id}"
  end

  delete '/articles/:id' do
    @article = Article.find(params[:id])
    @article.destroy

    redirect 'articles'
  end

end
