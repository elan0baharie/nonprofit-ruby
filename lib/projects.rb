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
      id = project.fetch('id').to_i()
      name = project.fetch('name')
      location = project.fetch('location')
      details = project.fetch('details')
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

  def update(attribute)
    @name = attribute.fetch(:name)
    @location = attribute.fetch(:location)
    @details = attribute.fetch(:details)
    @id = self.id()
    DB.exec("UPDATE projects SET name = '#{@name}', location = '#{@location}', details = '#{@details}' WHERE id = #{@id};")
  end


  def delete
    DB.exec("DELETE FROM projects WHERE id= #{self.id()};")
  end

  def volunteers
    project_vols = []
    desired_vol_list = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id()};")
    desired_vol_list.each() do |volunteer|
      id = volunteer.fetch('id').to_i()
      name = volunteer.fetch('name')
      address = volunteer.fetch('address')
      details = volunteer.fetch('details')
      project_id = volunteer.fetch('project_id').to_i()
      project_vols.push(Volunteers.new({:id => id, :name => name, :address => address, :details => details, :project_id => project_id}))
    end
    project_vols
  end
end
