# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

counts = CensusCount.create({area_id: 'E05000353', totpop: 20, male: 10, female: 10})
counts = CensusCount.create({area_id: 'E05000357', totpop: 25, male: 12, female: 13})