require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# the next line allows sending PATCH and DELETE requests
use Rack::MethodOverride

# mount other controllers with "use"
use SessionsController
use PerformancesController
use UsersController
run ApplicationController
