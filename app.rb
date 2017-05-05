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

get("/volunteers/:id/edit") do
  @projects = Projects.all()
  @volunteer = Volunteers.find(params.fetch("id").to_i())
  erb(:volunteer_edit)
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

patch('/volunteers/:id') do
  name = params.fetch('name')
  address = params.fetch('address')
  details = params.fetch('details')
  project_id = params.fetch('projects_list').to_i()
  @projects = Projects.all()
  @volunteer = Volunteers.find(params.fetch("id").to_i())
  @volunteer.update({:name => name, :address => address, :details => details, :project_id => project_id})
  erb(:success)
end

delete("/volunteers/:id") do
  @volunteer = Volunteers.find(params.fetch("id").to_i())
  @volunteer.delete()
  erb(:success)
end

get('/success') do
  erb(:success)
end

get('/projects') do
  @volunteers = Volunteers.all()
  @projects = Projects.all()
  erb(:projects)
end

get('/projects/new') do
  @volunteers = Volunteers.all()
  @projects = Projects.all()
  erb(:projects)
end

get("/projects/:id/edit") do
  @volunteers = Volunteers.all()
  @projects = Projects.all()
  @project = Projects.find(params.fetch("id").to_i())
  erb(:projects_edit)
end

post('/projects') do
  name = params.fetch('name')
  location = params.fetch('location')
  details = params.fetch('details')
  new_project = Projects.new({:id => nil, :name => name, :location => location, :details => details})
  new_project.save()
  erb(:success)
end

patch('/projects/:id') do
  name = params.fetch('name')
  location = params.fetch('location')
  details = params.fetch('details')
  @project = Projects.find(params.fetch("id").to_i())
  @project.update({:name => name, :location => location, :details => details})
  erb(:success)
end


delete('/projects/:id') do
  @project = Projects.find(params.fetch("id").to_i())
  @project.delete()
  erb(:success)
end
