require "csv"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Read in data/CensusVar.txt tsv
puts 'Seeding Census variable names table'
parsed_file = CSV.read("public/data/CensusVar.txt", { :col_sep => "\t", :headers=>:first_row})
CensusVar.delete_all
parsed_file.each do |row|
	CensusVar.create({variableid: row[0], varlabel: row[1].downcase, longlabel: row[2], units: row[3] })
end

# Read in Census data
puts 'Seeding Census data table'
parsed_file = CSV.read("public/data/census_by_postcodedistrict.csv", { :col_sep => ",", :headers=>:first_row})
parsed_file.each do |row|
   CensusCount.create({postarea: row[0], totpop: row[1], totpop01: row[2], totadult: row[3], tot16to74: row[4], totemploy: row[5], ttwbasepop: row[6], hhdpop: row[7], commpop: row[8], dwelling: row[9], hhdspace: row[10], hhdocc: row[11], hhdempty: row[12], male: row[13], female: row[14], age0to4: row[15], age5to7: row[16], age8to9: row[17], age10to14: row[18], age15: row[19], age16to17: row[20], age18to19: row[21], age20to24: row[22], age25to29: row[23], age30to44: row[24], age45to59: row[25], age60to64: row[26], age65to74: row[27], age75to84: row[28], age85to89: row[29], age90plus: row[30], single: row[31], married: row[32], samesex: row[33], separated: row[34], divorced: row[35], widowed: row[36], white: row[37], mixedeth: row[38], indian: row[39], pakistani: row[40], bangladesh: row[41], chinese: row[42], otherasian: row[43], blafrican: row[44], blcarib: row[45], blother: row[46], othereth: row[47], cobengland: row[48], cobwales: row[49], cobscot: row[50], cobni: row[51], cobroi: row[52], coboldeu: row[53], cobneweu: row[54], cobother: row[55], passnone: row[56], passuk: row[57], passroi: row[58], passoldeu: row[59], passneweu: row[60], passafrica: row[61], passmea: row[62], passnam: row[63], passcam: row[64], passsam: row[65], passocean: row[66], catholic: row[67], otchrist: row[68], totchrist: row[69], buddhist: row[70], hindu: row[71], jewish: row[72], muslim: row[73], sikh: row[74], otrel: row[75], tototrel: row[76], noreligion: row[77], religionns: row[78], vghealth: row[79], ghealth: row[80], fairhealth: row[81], badhealth: row[82], vbadhealth: row[83], eaemppt: row[84], eaempft: row[85], easelfemp: row[86], eaunemp: row[87], eafutist: row[88], eiretired: row[89], eifutist: row[90], eihome: row[91], eisickdis: row[92], eiother: row[93], agricult: row[94], extractive: row[95], manufact: row[96], energysup: row[97], watersup: row[98], construct: row[99], retail: row[100], transport: row[101], accommfood: row[102], infocomms: row[103], finserv: row[104], propserv: row[105], proftech: row[106], administ: row[107], pubaddef: row[108], education: row[109], health: row[110], otherind: row[111], empandmgr: row[112], highprof: row[113], lowprof: row[114], intermed: row[115], smempseem: row[116], lowsuper: row[117], semirout: row[118], routine: row[119], neverwork: row[120], ltunemp: row[121], notclass: row[122], noquals: row[123], qual1: row[124], qual2: row[125], qualapp: row[126], qual3: row[127], qual4: row[128], qualother: row[129], stud16to17: row[130], stud18plus: row[131], ftsemploy: row[132], ftsunemp: row[133], ftsecinact: row[134], ttwhome: row[135], ttwtrain: row[136], ttwtube: row[137], ttwbus: row[138], ttwmbike: row[139], ttwcar: row[140], ttwcarpass: row[141], ttwtaxi: row[142], ttwbike: row[143], ttwfoot: row[144], ttwother: row[145], pens1pers: row[146], other1pers: row[147], pensfamily: row[148], manokid: row[149], madepkid: row[150], mandepkid: row[151], conokid: row[152], codepkid: row[153], condepkid: row[154], lpdepkid: row[155], lpndepkid: row[156], othdepkid: row[157], allstudent: row[158], otherpens: row[159], otherhhd: row[160], dwunshared: row[161], dwshared: row[162], detached: row[163], semidetach: row[164], terrace: row[165], flatpur: row[166], flatconsha: row[167], commbuild: row[168], caravmob: row[169], ownout: row[170], ownmort: row[171], ownshare: row[172], soccouncil: row[173], socother: row[174], privrentl: row[175], privrento: row[176], rentfree: row[177], nocars: row[178], car1: row[179], car2: row[180], car3: row[181], car4plus: row[182], pers1hhd: row[183], pers2hhd: row[184], pers3hhd: row[185], pers4hhd: row[186], pers5hhd: row[187], pers6hhd: row[188], pers7hhd: row[189], pers8phhd: row[190]})
end