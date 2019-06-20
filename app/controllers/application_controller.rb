
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do

    set :public_folder, 'public'
    set :views, 'app/views'

  end

  get '/articles/new' do

    erb :new

  end

  post '/articles' do

    Article.create(title: params[:article][:title], content: params[:article][:content])


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

    @article_object = Article.find(params[:id])

    erb :edit

  end

  patch '/articles/:id' do

    @article = Article.find(params[:id])
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.save
    redirect to "/articles/#{ params[:id] }"
  end






end
