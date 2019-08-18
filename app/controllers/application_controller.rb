
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/' do
    redirect '/articles'
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

get '/articles/new' do
  erb :new
end

post '/articles' do
  Article.new(
    title: params[:title],
    content: params[:content],
      ).tap do |article|
    article.save
    redirect "/articles/#{article.id}"
    end
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
  Article.find(params[:id]).tap do |article|
    Article.update(
      title: params[:title],
    content: params[:content],
        )

    redirect "/articles/#{article.id}"

  end
end




delete '/articles/:id/delete' do
  Article.find(params[:id]).destroy
    redirect '/articles'
  end

end
