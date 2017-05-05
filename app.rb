require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/volunteers')
require('./lib/projects')
require('pry')

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

get('/') do
  erb(:index)
end



# post('/first_form') do
#   @first_name = params.fetch('first-name')
#   @last_name = params.fetch('last-name')
#   @job = params.fetch('job')
#   @company = params.fetch('company')
#   @contact = Contact.new({:first_name=> @first_name, :last_name=>@last_name, :job_title=>@job, :company=>@company})
#   @contact.save()
#   @contacts = Contact.all()
#   erb(:success)
# end
