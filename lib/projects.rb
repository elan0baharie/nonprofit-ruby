class Projects
  attr_accessor(:id, :name, :location, :details, :volunteer_ids)

  define_method(:initialize) do |attribute|
    @name = attribute.fetch(:name)
    @location = attribute.fetch(:location)
    @details = attribute.fetch(:details)
  end

  
end
