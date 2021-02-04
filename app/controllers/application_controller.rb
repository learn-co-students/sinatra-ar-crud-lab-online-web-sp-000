#2. After the database connection, we have to create in the root directory a file called 'app.rb', that's in which we create a class called 'Application' 
# and make it inherit from 'Sinatra::Base', so that all instances of 'Application' can use all Sinatra features.
#5. create the routes/actions that will distinguish different requests to fire a specific block of code
# where it will use the logic of 'models'
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
end
