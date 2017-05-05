require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)



describe("add a project to the projects page", {:type => :feature}) do
  it("accept a new project") do
    visit('/')
    click_on('Add New Projects')
    fill_in('name', :with => "Shelter for Animals")
    fill_in('location', :with => "234 Ross St. , Seattle, WA 98116")
    fill_in('details', :with => "Home to animals")
    click_button('Submit')
    click_on('Back to Home')
    click_on('See Project List')
    expect(page).to have_content("Shelter for Animals")
  end
end
