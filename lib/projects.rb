class Projects
  attr_accessor(:id, :name, :location, :details, :volunteer_ids)

  define_method(:initialize) do |attribute|
    @name = attribute.fetch(:name)
    @location = attribute.fetch(:location)
    @details = attribute.fetch(:details)
  end

  def self.all
    all_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    all_projects.each() do |project|
      name = project.fetch('name')
      location = project.fetch('location')
      details = project.fetch('details')
      volunteer_ids = project.fetch('volunteer_ids')
      projects.push(Projects.new({:name => name, :location => location, :details => details, :volunteer_ids => volunteer_ids}))
    end
    projects
  end

  def ==(another_project)
    (self.id() == another_project.id()) && (self.name() == another_project.name()) && (self.location() == another_project.location()) && (self.details() == another_project.details()) && (self.volunteer_ids() == another_project.volunteer_ids())
  end

  def save
    DB.exec("INSERT INTO projects (name, location, details) VALUES ('#{@name}', '#{@location}', '#{@details}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def self.find(id)
    found_project = nil
    Projects.all().each() do |project|
      if project.id() == id
        found_project = project
      end
    end
    found_project
  end
end
