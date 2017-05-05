require('spec-helper')


describe(Volunteers) do

  describe('#name') do
    it("will give the name of the choosen volunteer") do
      test_volunteer = Volunteers.new({:id => nil, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals"})
      expect(test_volunteer.name()).to(eq("Robin"))
    end
  end

  describe('#id') do
    it("will tell me the id of the entry after its saved") do
      test_volunteer = Volunteers.new({:id => nil, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals"})
      test_volunteer.save()
      expect(test_volunteer.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same volunteer if it is the same info") do
      test_volunteer1 = Volunteers.new({:id => 1, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals"})
      test_volunteer2 = Volunteers.new({:id => 1, :name => "Robin", :address => "123 Main St., Seattle, WA 98116", :details => "Loves Animals"})
      expect(test_volunteer1).to(eq(test_volunteer2))
    end
  end

  describe(".all") do
    it("is empty at first but it exists as a class method") do
      expect(Volunteers.all()).to(eq([]))
    end
  end

end
