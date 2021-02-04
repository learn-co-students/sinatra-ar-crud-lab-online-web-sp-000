#3. Create a 'config.ru' file to be an entry point for the app. So we will have to put the following code in that file
require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride

  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
# The purpose of this file is to detail to Rack the environment requirements of the application and start the application. 
# generally we load the Sinatra library on the first line
# The second line requires our application file
# the last line uses run to start the application represented by the ruby class Application.
# when 'shotgun' or 'rackup' command is run, this file is where it looks for as an entry point.


