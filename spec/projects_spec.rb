require('spec-helper')

describe(Projects) do

  describe('#name') do
    it("will give the name of the choosen project") do
      test_project = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals"})
      expect(test_project.name()).to(eq("Fair St. Shelter"))
    end
  end


  describe('#id') do
    it("will tell me the id of the entry after its saved") do
      test_project = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals"})
      test_project.save()
      expect(test_project.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same project if it is the same info") do
      test_project1 = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals"})
      test_project2 = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals"})
      expect(test_project1).to(eq(test_project2))
    end
  end

  describe(".all") do
    it("is empty at first but it exists as a class method") do
      expect(Projects.all()).to(eq([]))
    end
  end

  describe("#update_main") do
    it("lets you update info in the database") do
      test_project1 = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals"})
      test_project1.save()
      test_project1.update_main({:name => "Fair St. Animal Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals"})
      expect(test_project1.name()).to(eq("Fair St. Animal Shelter"))
    end
  end

  describe("#delete") do
    it("will delete a chosen project class obj from database") do
      test_project1 = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals"})
      test_project1.save()
      test_project2 = Projects.new({:id => nil, :name => "Project Diana", :location => "45 North Ave., Seattle, WA 98516", :details => 'Womens shelter to get the disadvanteged back into the work force.'})
      test_project2.save()
      test_project1.delete()
      expect(Projects.all()).to(eq([test_project2]))
    end
  end

  describe(".find") do
    it("will return a specific project by its id") do
      test_project1 = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals"})
      test_project1.save()
      test_project2 = Projects.new({:id => nil, :name => "Project Diana", :location => "45 North Ave., Seattle, WA 98516", :details => 'Womens shelter to get the disadvanteged back into the work force.'})
      test_project2.save()
      expect(Projects.find(test_project1.id())).to(eq(test_project1))
    end
  end

  describe("volunteers") do
    it("will return all the volunteers with the required project id") do
      test_project2 = Projects.new({:id => nil, :name => "Project Diana", :location => "45 North Ave., Seattle, WA 98516", :details => 'Womens shelter to get the disadvanteged back into the work force.'})
      test_project2.save()

      test_volunteer1 = Volunteers.new({:id => 1, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals", :project_id => test_project2.id()})
      test_volunteer1.save()
      test_volunteer2 = Volunteers.new({:id => 5, :name => "Stu", :address => "363 Rebel Ave., Seattle, WA 98115", :details => "Hates Animals", :project_id => test_project2.id()})
      test_volunteer2.save()
      expect(test_project2.volunteers()).to(eq([test_volunteer1, test_volunteer2]))
    end
  end
end
