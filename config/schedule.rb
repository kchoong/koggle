# Use this file to easily define all of your cron jobs.
#
# Learn more: http://github.com/javan/whenever

#Creates a output log for you to view previously run cron jobs
set :output, "log/cron.log"

#Sets the environment to run during development mode (Set to production by default)
set :environment, "development"

every 1.day, at: '0:00 am' do
  rake "shifts:close_all_active"
end