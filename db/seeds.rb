# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Airport.delete_all
Flight.delete_all

Airport.create!(code: "SFO")
Airport.create!(code: "NYC")
Airport.create!(code: "JFK")

12.step(24, 3) do |n|
  Flight.create!(start: Time.utc(2016, 5, 1, n, 00),
                 duration: Time.utc(2016, 5, 1, 5, 30),
                 from_id: Airport.find_by(code: "SFO").id,
                 to_id: Airport.find_by(code: "NYC").id)
  Flight.create!(start: Time.utc(2016, 5, 3, n, 00),
                 duration: Time.utc(2016, 5, 1, 4, 30),
                 from_id: Airport.find_by(code: "NYC").id,
                 to_id: Airport.find_by(code: "SFO").id)
  Flight.create!(start: Time.utc(2016, 5, 1, n, 00),
                 duration: Time.utc(2016, 5, 1, 7, 00),
                 from_id: Airport.find_by(code: "SFO").id,
                 to_id: Airport.find_by(code: "JFK").id)
end

1.step(4, 2) do |n|
  Flight.create!(start: Time.utc(2016, 5, 2, n, 00),
                 duration: Time.utc(2016, 5, 1, 5, 30),
                 from_id: Airport.find_by(code: "SFO").id,
                 to_id: Airport.find_by(code: "NYC").id)
  Flight.create!(start: Time.utc(2016, 5, 4, n, 00),
                 duration: Time.utc(2016, 5, 1, 4, 30),
                 from_id: Airport.find_by(code: "NYC").id,
                 to_id: Airport.find_by(code: "SFO").id)
  Flight.create!(start: Time.utc(2016, 5, 2, n, 00),
                 duration: Time.utc(2016, 5, 1, 7, 00),
                 from_id: Airport.find_by(code: "SFO").id,
                 to_id: Airport.find_by(code: "JFK").id)
end
