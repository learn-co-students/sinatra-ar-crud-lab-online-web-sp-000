
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

    Article.create(params)
    redirect "/show"
  end

  get '/show' do
    @article = Article.last
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles' do

    @all_articles = []
    Article.all.each do |article|
      @all_articles<<article
    end
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show

  end

get '/articles/:id/edit' do
  @article = Article.find(params[:id])
  erb :edit
end

patch '/articles/:id' do
   @article = Article.find(params[:id])
   @article.tap do |a|
     a.title = params[:title]
     a.content = params[:content]
     a.save
   end
    redirect "/articles/#{@article.id}"
 end

 delete '/articles/:id' do
   @article = Article.find(params[:id])
   @article.delete
   redirect '/articles'
 end

end
