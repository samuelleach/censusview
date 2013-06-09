require "csv"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# counts = CensusCount.create({area_id: 'E05000353', totpop: 20, male: 10, female: 10})
# counts = CensusCount.create({area_id: 'E05000357', totpop: 25, male: 12, female: 13})




# Read in data/CensusVar.txt tsv
parsed_file = CSV.read("public/data/CensusVar.txt", { :col_sep => "\t", :headers=>:first_row})
puts parsed_file[0][0]

# For each line, insert an entry in CensusVar
CensusVar.delete_all
parsed_file.each do |row|
	CensusVar.create({VariableID: row[0], VarLabel: row[1], LongLabel: row[2], Units: row[3] })
end