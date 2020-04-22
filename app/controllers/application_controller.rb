
require_relative '../../config/environment'
require_relative '../models/article'

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
    Article.create(params)
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id/edit' do

    @article = Article.find(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    edited_article = Article.find(params[:id])
    new_title = params[:title]
    new_content = params[:content]

    if new_title != "" && new_content != ""
      edited_article.update(title: new_title, content: new_content)
    elsif new_title == "" && new_content != ""
      edited_article.update(content: new_content)
    elsif new_title != "" && new_content == ""
      edited_article.update(title: new_title)
    else
      break
    end
    redirect "/articles/#{edited_article.id}"
  end

  delete '/articles/:id' do
    article_to_be_deleted = Article.find(params[:id])
    article_to_be_deleted.destroy
    redirect '/articles'
  end

end
