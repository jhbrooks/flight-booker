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

Flight.create!(start: Time.now,
               duration: Time.now,
               from_id: Airport.find_by(code: "SFO").id,
               to_id: Airport.find_by(code: "NYC").id)
Flight.create!(start: Time.now,
               duration: Time.now,
               from_id: Airport.find_by(code: "NYC").id,
               to_id: Airport.find_by(code: "SFO").id)
Flight.create!(start: Time.now,
               duration: Time.now,
               from_id: Airport.find_by(code: "SFO").id,
               to_id: Airport.find_by(code: "JFK").id)
