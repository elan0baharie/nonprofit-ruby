require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)



describe("form behavior", {:type => :feature}) do
  it("accept a new contact") do
    visit('/')
    click_on('See Contact List/ Add New Contacts')
    fill_in('first-name', :with => "Bob")
    fill_in('last-name', :with => "Ross")
    fill_in('job', :with => "Painter")
    fill_in('company', :with => "PBS")
    click_button('Click')
    click_on('Back to contacts list')
    expect(page).to have_content("Bob")
  end
end
