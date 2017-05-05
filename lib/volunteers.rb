class Volunteers
  attr_accessor(:id, :name, :address, :details, :project_id)

  define_method(:initialize) do |attribute|
    @id = attribute.fetch(:id)
    @name = attribute.fetch(:name)
    @address = attribute.fetch(:address)
    @details = attribute.fetch(:details)
    @project_id = attribute.fetch(:project_id)
  end

  def self.all
    all_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    all_volunteers.each() do |volunteer|
      id = volunteer.fetch('id').to_i()
      name = volunteer.fetch('name')
      address = volunteer.fetch('address')
      details = volunteer.fetch('details')
      project_id = volunteer.fetch('project_id').to_i()
      volunteers.push(Volunteers.new({:id => id, :name => name, :address => address, :details => details, :project_id => project_id}))
    end
    volunteers
  end

  def ==(another_volunteer)
    (self.id() == another_volunteer.id()) && (self.name() == another_volunteer.name()) && (self.address() == another_volunteer.address()) && (self.details() == another_volunteer.details()) && (self.project_id() == another_volunteer.project_id())
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, address, details, project_id) VALUES ('#{@name}', '#{@address}', '#{@details}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  def self.find(id)
    found_volunteer = nil
    Volunteers.all().each() do |volunteer|
      if volunteer.id() == id
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

  def update(attribute)
    @name = attribute.fetch(:name)
    @address = attribute.fetch(:address)
    @details = attribute.fetch(:details)
    @project_id = attribute.fetch(:project_id)
    @id = self.id()
    DB.exec("UPDATE volunteers SET name = '#{@name}', address = '#{@address}', details = '#{@details}', project_id = #{@project_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id= #{self.id()};")
  end
end
