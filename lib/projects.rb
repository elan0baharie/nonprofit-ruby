class Projects
  attr_accessor(:id, :name, :location, :details)

  define_method(:initialize) do |attribute|
    @id = attribute.fetch(:id)
    @name = attribute.fetch(:name)
    @location = attribute.fetch(:location)
    @details = attribute.fetch(:details)
  end

  def self.all
    all_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    all_projects.each() do |project|
      id = volunteer.fetch('id').to_i()
      name = project.fetch('name')
      location = project.fetch('location')
      details = project.fetch('details')
      volunteer_ids = project.fetch('volunteer_ids')
      projects.push(Projects.new({:id => id, :name => name, :location => location, :details => details}))
    end
    projects
  end

  def ==(another_project)
    (self.id() == another_project.id()) && (self.name() == another_project.name()) && (self.location() == another_project.location()) && (self.details() == another_project.details())
  end

  def save
    result = DB.exec("INSERT INTO projects (name, location, details) VALUES ('#{@name}', '#{@location}', '#{@details}') RETURNING id;")
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

  def update_main (attribute)
    @name = attribute.fetch(:name)
    @location = attribute.fetch(:location)
    @details = attribute.fetch(:details)
    @id = self.id()
    DB.exec("UPDATE projects SET name = '#{@name}', location = '#{@location}', details = '#{@details}' WHERE id = #{@id};")
  end

end
