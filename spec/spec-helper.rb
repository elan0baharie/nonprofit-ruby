require('pg')
require('rspec')
require('volunteers')
require('pry')
require('projects')


DB = PG.connect({:dbname => 'non_profit_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM volunteers *;")
    DB.exec("DELETE FROM projects *;")
  end
end