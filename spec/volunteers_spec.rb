require('spec-helper')


describe(Volunteers) do

  describe('#name') do
    it("will give the name of the choosen volunteer") do
      test_volunteer = Volunteers.new({:id => nil, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals", :project_id => 0})
      expect(test_volunteer.name()).to(eq("Robin"))
    end
  end

  describe('#id') do
    it("will tell me the id of the entry after its saved") do
      test_volunteer = Volunteers.new({:id => nil, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals", :project_id => 0})
      test_volunteer.save()
      expect(test_volunteer.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#project_id') do
    it("will tell me the id of the entry after its saved") do
      test_volunteer = Volunteers.new({:id => nil, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals", :project_id => 3})
      test_volunteer.save()
      expect(test_volunteer.project_id()).to(eq(3))
    end
  end

  describe("#==") do
    it("is the same volunteer if it is the same info") do
      test_volunteer1 = Volunteers.new({:id => 1, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals", :project_id => 0})
      test_volunteer2 = Volunteers.new({:id => 1, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals", :project_id => 0})
      expect(test_volunteer1).to(eq(test_volunteer2))
    end
  end

  describe(".all") do
    it("is empty at first but it exists as a class method") do
      expect(Volunteers.all()).to(eq([]))
    end
  end

  describe("#update") do
    it("lets you update info in the database") do
      volunteer = Volunteers.new({:id => 1, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals", :project_id => 0})
      volunteer.save()
      volunteer.update({:name => "Stu", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals", :project_id => 0})
      expect(volunteer.name()).to(eq("Stu"))
    end
  end

  describe("#delete") do
    it("will delete a chosen volunteer class obj from database") do
      test_volunteer1 = Volunteers.new({:id => 1, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals", :project_id => 0})
      test_volunteer1.save()
      test_volunteer2 = Volunteers.new({:id => 5, :name => "Stu", :address => "363 Rebel Ave., Seattle, WA 98115", :details => "Hates Animals", :project_id => 0})
      test_volunteer2.save()
      test_volunteer1.delete()
      expect(Volunteers.all()).to(eq([test_volunteer2]))
    end
  end

  describe(".find") do
    it("will return a specific volunteer by its id") do
      test_volunteer1 = Volunteers.new({:id => nil, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals", :project_id => 0})
      test_volunteer1.save()
      test_volunteer2 = Volunteers.new({:id => nil, :name => "Stu", :address => "363 Rebel Ave., Seattle, WA 98115", :details => "Hates Animals", :project_id => 0})
      test_volunteer2.save()
      expect(Volunteers.find(test_volunteer2.id())).to(eq(test_volunteer2))
    end
  end

end
