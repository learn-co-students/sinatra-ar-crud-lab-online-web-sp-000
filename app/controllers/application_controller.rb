
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure() {set :public_folder, 'public'; set :views, 'app/views'}

  get('/') {erb :index}
  get('/articles') {@articles = Article.all; erb :index}
  get('/articles/new') {@article = Article.new; erb :new}
  get('/articles/:id') {@article = Article.find(params[:id]); erb :show}
  get('/articles/:id/edit') {@article = Article.find(params[:id]); erb :edit}

  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  delete('/articles/:id') {Article.destroy(params[:id]); erb :index}
  patch '/articles/:id' do
    Article.find(params[:id]).update(params[:article])
    redirect "/articles/#{@article.id}"
  end
end
