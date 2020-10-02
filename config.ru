require './config/environment'

begin
  fi_check_migration

  use Rack::MethodOverride # allows Sinatra to override with PATCH, PUT, and DELETE requests

  run ApplicationController # apps can only have one 'run' method; all other methods are 'use'
rescue ActiveRecord::PendingMigrationError => err
  STDERR.puts err
  exit 1
end