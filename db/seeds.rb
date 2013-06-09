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
	CensusVar.create({VariableID: row[0], VarLabel: row[1], LongLabel: row[2], Units: row[3] })
end

# Read in Census data
puts 'Seeding Census data table'
parsed_file = CSV.read("public/data/census_by_postcodedistrict.csv", { :col_sep => ",", :headers=>:first_row})
CensusCount.delete_all
parsed_file.each do |row|
	CensusCount.create({PostArea: row[0], TotPop: row[1], TotPop01: row[2], TotAdult: row[3], Tot16to74: row[4], TotEmploy: row[5], TTWBasePop: row[6], HhdPop: row[7], CommPop: row[8], Dwelling: row[9], HhdSpace: row[10], HhdOcc: row[11], HhdEmpty: row[12], Male: row[13], Female: row[14], Age0to4: row[15], Age5to7: row[16], Age8to9: row[17], Age10to14: row[18], Age15: row[19], Age16to17: row[20], Age18to19: row[21], Age20to24: row[22], Age25to29: row[23], Age30to44: row[24], Age45to59: row[25], Age60to64: row[26], Age65to74: row[27], Age75to84: row[28], Age85to89: row[29], Age90plus: row[30], Single: row[31], Married: row[32], SameSex: row[33], Separated: row[34], Divorced: row[35], Widowed: row[36], White: row[37], MixedEth: row[38], Indian: row[39], Pakistani: row[40], Bangladesh: row[41], Chinese: row[42], OtherAsian: row[43], BlAfrican: row[44], BlCarib: row[45], BlOther: row[46], OtherEth: row[47], CoBEngland: row[48], CoBWales: row[49], CoBScot: row[50], CoBNI: row[51], CoBROI: row[52], CoBOldEU: row[53], CoBNewEU: row[54], CoBOther: row[55], PassNone: row[56], PassUK: row[57], PassROI: row[58], PassOldEU: row[59], PassNewEU: row[60], PassAfrica: row[61], PassMEA: row[62], PassNAm: row[63], PassCAm: row[64], PassSAm: row[65], PassOcean: row[66], Catholic: row[67], OtChrist: row[68], TotChrist: row[69], Buddhist: row[70], Hindu: row[71], Jewish: row[72], Muslim: row[73], Sikh: row[74], OtRel: row[75], TotOtRel: row[76], NoReligion: row[77], ReligionNS: row[78], VGHealth: row[79], Ghealth: row[80], FairHealth: row[81], BadHealth: row[82], VBadHealth: row[83], EAEmpPT: row[84], EAEmpFT: row[85], EASelfEmp: row[86], EAUnemp: row[87], EAFuTiSt: row[88], EIRetired: row[89], EIFuTiSt: row[90], EIHome: row[91], EISickDis: row[92], EIOther: row[93], Agricult: row[94], Extractive: row[95], Manufact: row[96], EnergySup: row[97], WaterSup: row[98], Construct: row[99], Retail: row[100], Transport: row[101], AccommFood: row[102], InfoComms: row[103], FinServ: row[104], PropServ: row[105], ProfTech: row[106], Administ: row[107], PubAdDef: row[108], Education: row[109], Health: row[110], OtherInd: row[111], EmpAndMgr: row[112], HighProf: row[113], LowProf: row[114], Intermed: row[115], SmEmpSeEm: row[116], LowSuper: row[117], SemiRout: row[118], Routine: row[119], NeverWork: row[120], LTUnemp: row[121], NotClass: row[122], NoQuals: row[123], Qual1: row[124], Qual2: row[125], QualApp: row[126], Qual3: row[127], Qual4: row[128], QualOther: row[129], Stud16to17: row[130], Stud18plus: row[131], FTSEmploy: row[132], FTSUnemp: row[133], FTSEcInact: row[134], TTWHome: row[135], TTWTrain: row[136], TTWTube: row[137], TTWBus: row[138], TTWMBike: row[139], TTWCar: row[140], TTWCarPass: row[141], TTWTaxi: row[142], TTWBike: row[143], TTWFoot: row[144], TTWOther: row[145], Pens1pers: row[146], Other1pers: row[147], PensFamily: row[148], MaNoKid: row[149], MaDepKid: row[150], MaNDepKid: row[151], CoNoKid: row[152], CoDepKid: row[153], CoNDepKid: row[154], LPDepKid: row[155], LPNDepKid: row[156], OthDepKid: row[157], AllStudent: row[158], OtherPens: row[159], OtherHhd: row[160], DwUnshared: row[161], DwShared: row[162], Detached: row[163], SemiDetach: row[164], Terrace: row[165], FlatPur: row[166], FlatConSha: row[167], CommBuild: row[168], CaravMob: row[169], OwnOut: row[170], OwnMort: row[171], OwnShare: row[172], SocCouncil: row[173], SocOther: row[174], PrivRentL: row[175], PrivRentO: row[176], RentFree: row[177], NoCars: row[178], Car1: row[179], Car2: row[180], Car3: row[181], Car4plus: row[182], Pers1Hhd: row[183], Pers2Hhd: row[184], Pers3Hhd: row[185], Pers4Hhd: row[186], Pers5Hhd: row[187], Pers6Hhd: row[188], Pers7Hhd: row[189], Pers8PHhd: row[190]})
end