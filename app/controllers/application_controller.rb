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
    article = Article.new({title: params[:title], content: params[:content]})
    article.save
    redirect to '/articles'
  end

  get '/articles' do
    @articles = Articles.all
    erb :index
  end

    get 'alticles/:id/edit' do
      @article = Article.find(params[:id].to_i)
      erb :edit
    end

  patch '/articles/:id' do
    article = Article.find(params[:id].to_i)
    article.update(title: params[:title])
    article.update(content: params[:content])
    article.save
    redirect to '/articles/'+ article.id.to_s
  end

  get '/articles/:id' do
    @article = Article.find(params[:id].to_i)
    erb :show
  end

  delete '/articles/:id/delete' do
    article = Article.find(params[:id].to_i)
    @name = article.name
    article.destroy
    erb :delete
  end

end
