require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/volunteers')
require('./lib/projects')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'volunteer_tracker'})

get('/') do
  erb(:index)
end

get('/volunteers') do
  @volunteers = Volunteers.all()
  erb(:volunteers)
end

get('/volunteers/new') do
  @volunteers = Volunteers.all()
  erb(:volunteers)
end

post('/volunteers') do
  name = params.fetch('name')
  address = params.fetch('address')
  details = params.fetch('details')
  project_id = params.fetch('project_id').to_i()
  new_volunteer = Volunteers.new({:id => nil, :name => name, :address => address, :details => details, :project_id => project_id})
  new_volunteer.save()
  erb(:success)
end

get('/success') do
  erb(:success)
end

get('/projects') do
  @projects = Projects.all()
  erb(:projects)
end

get('/projects/new') do
  @projects = Projects.all()
  erb(:projects)
end

post('/projects') do
  name = params.fetch('name')
  location = params.fetch('location')
  details = params.fetch('details')
  new_project = Projects.new({:id => nil, :name => name, :location => location, :details => details})
  new_project.save()
  erb(:success)
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
