
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
    Article.create(:title => params[:title], :content => params[:content])
    redirect "/articles/#{Article.last.id}"
  end

  get '/articles/:id' do
    @article = Article.find_by id: params[:id]
    erb :show
  end

  get '/articles' do
    @articles = Article.all
    binding.pry
    erb :index
  end

end
