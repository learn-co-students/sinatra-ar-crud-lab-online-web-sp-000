require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

# this will show a list of ALL articles
  get '/' do
    redirect '/articles'
  end

# this pops up a form to fill for a new article.
# this controller action should use a Create CRUD action to create the article and save it to the db.
  get '/articles/new' do
    erb :new
  end

# when the form for the new article is submitted, this action will trigger a render of an index erb file automatically.
  post '/articles' do
#    @article = Article.create(title: params[:title], content: params[:content])
    @article = Article.create(params)
    redirect '/articles' + params[:id]
    erb :index
  end

# this will read ALL articles by using ActiveRecord
# it will grab them all and store them in an
# instance variable, @articles.
# then it should render the index.erb view
# that view will iterate over @articles
  get '/articles' do
    @articles = Article.all

    erb :index
  end

# this action should use ActiveRecord to grab the
# article with the id that is in the params and
# set it equal to @article
  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])

    erb :show
  end

# the update CRUD action corresponds to the 'edit'
# controller action and view
# this view should contain a form and post to a
# controller action: patch '/articles/:id'
  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])

    erb :edit
  end

  patch '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.name = params[:name]
    @article.content = params[:name]
    @article.save

    erb :show
  end

# To initiate this action we need to add a Delete button to the show page. The button will be in a form isn't visible
# by default so we should only see the button.
# The form will send a a request to the delete controller action where the article will be indentified and deleted.
# Then the action should redirect to the index of all articles. It is indeed imposible to go back to the show page since
# the article has been deleted
  delete '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.destroy
    erb :index
  end

end
