
require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride #allows app to hangle PATCH, PUT, DELETE requests

  run ApplicationController
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end
