# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

subway_lines = SubwayLine.create([{name: "456"},
                                {name: "BDFM"},
                                {name: "G"},
                                {name: "JZ"},
                                {name: "L"},
                                {name: "7"},
                                {name: "NQR"},
                                {name: "S"},
                                {name: "123"}])

subway_lines.each do |subway_line|
  3.times do subway_line.users.create
  end
end

