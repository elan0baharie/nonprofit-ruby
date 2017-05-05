class Volunteers
  attr_accessor(:id, :name, :address, :details)

  define_method(:initialize) do |attribute|
    @name = attribute.fetch(:name)
    @address = attribute.fetch(:address)
    @details = attribute.fetch(:details)
  end

  def self.all
    all_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    all_volunteers.each() do |volunteer|
      name = attribute.fetch('name')
      address = attribute.fetch('address')
      details = attribute.fetch('details')
      volunteers.push(Volunteers.new({:name => name, :address => address, :details => details}))
    end
    volunteers
  end

  def ==(another_volunteer)
    (self.id() == another_volunteer.id()) && (self.name() == another_volunteer.name()) && (self.address() == another_volunteer.address()) && (self.details() == another_volunteer.details())
  end

  def save
    DB.exec("INSERT INTO volunteers (name) VALUES ('#{@name}', '#{@address}', '#{@details}') RETURNING id;")
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

end
