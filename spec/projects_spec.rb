require('spec-helper')

describe(Projects) do

  describe('#name') do
    it("will give the name of the choosen project") do
      test_project = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals", :volunteer_ids => nil})
      expect(test_project.name()).to(eq("Fair St. Shelter"))
    end
  end


  describe('#id') do
    it("will tell me the id of the entry after its saved") do
      test_project = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals", :volunteer_ids => nil})
      test_project.save()
      expect(test_project.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same project if it is the same info") do
      test_project1 = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals", :volunteer_ids => nil})
      test_project2 = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals", :volunteer_ids => nil})
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
      test_project1 = Projects.new({:id => nil, :name => "Fair St. Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals", :volunteer_ids => nil})
      test_project1.save()
      test_project1.update_main({:name => "Fair St. Animal Shelter", :location => "4567 West Ave., Seattle, WA 98416", :details => "Home to many animals"})
      expect(test_project1.name()).to(eq("Fair St. Animal Shelter"))
    end
  end

end
