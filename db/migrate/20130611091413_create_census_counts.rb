class CreateCensusCounts < ActiveRecord::Migration
  def change
    create_table :census_counts do |t|
      t.string :postarea
      t.integer :totpop
      t.integer :totpop01
      t.integer :totadult
      t.integer :tot16to74
      t.integer :totemploy
      t.integer :ttwbasepop
      t.integer :hhdpop
      t.integer :commpop
      t.integer :dwelling
      t.integer :hhdspace
      t.integer :hhdocc
      t.integer :hhdempty
      t.integer :male
      t.integer :female
      t.integer :age0to4
      t.integer :age5to7
      t.integer :age8to9
      t.integer :age10to14
      t.integer :age15
      t.integer :age16to17
      t.integer :age18to19
      t.integer :age20to24
      t.integer :age25to29
      t.integer :age30to44
      t.integer :age45to59
      t.integer :age60to64
      t.integer :age65to74
      t.integer :age75to84
      t.integer :age85to89
      t.integer :age90plus
      t.integer :single
      t.integer :married
      t.integer :samesex
      t.integer :separated
      t.integer :divorced
      t.integer :widowed
      t.integer :white
      t.integer :mixedeth
      t.integer :indian
      t.integer :pakistani
      t.integer :bangladesh
      t.integer :chinese
      t.integer :otherasian
      t.integer :blafrican
      t.integer :blcarib
      t.integer :blother
      t.integer :othereth
      t.integer :cobengland
      t.integer :cobwales
      t.integer :cobscot
      t.integer :cobni
      t.integer :cobroi
      t.integer :coboldeu
      t.integer :cobneweu
      t.integer :cobother
      t.integer :passnone
      t.integer :passuk
      t.integer :passroi
      t.integer :passoldeu
      t.integer :passneweu
      t.integer :passafrica
      t.integer :passmea
      t.integer :passnam
      t.integer :passcam
      t.integer :passsam
      t.integer :passocean
      t.integer :catholic
      t.integer :otchrist
      t.integer :totchrist
      t.integer :buddhist
      t.integer :hindu
      t.integer :jewish
      t.integer :muslim
      t.integer :sikh
      t.integer :otrel
      t.integer :tototrel
      t.integer :noreligion
      t.integer :religionns
      t.integer :vghealth
      t.integer :ghealth
      t.integer :fairhealth
      t.integer :badhealth
      t.integer :vbadhealth
      t.integer :eaemppt
      t.integer :eaempft
      t.integer :easelfemp
      t.integer :eaunemp
      t.integer :eafutist
      t.integer :eiretired
      t.integer :eifutist
      t.integer :eihome
      t.integer :eisickdis
      t.integer :eiother
      t.integer :agricult
      t.integer :extractive
      t.integer :manufact
      t.integer :energysup
      t.integer :watersup
      t.integer :construct
      t.integer :retail
      t.integer :transport
      t.integer :accommfood
      t.integer :infocomms
      t.integer :finserv
      t.integer :propserv
      t.integer :proftech
      t.integer :administ
      t.integer :pubaddef
      t.integer :education
      t.integer :health
      t.integer :otherind
      t.integer :empandmgr
      t.integer :highprof
      t.integer :lowprof
      t.integer :intermed
      t.integer :smempseem
      t.integer :lowsuper
      t.integer :semirout
      t.integer :routine
      t.integer :neverwork
      t.integer :ltunemp
      t.integer :notclass
      t.integer :noquals
      t.integer :qual1
      t.integer :qual2
      t.integer :qualapp
      t.integer :qual3
      t.integer :qual4
      t.integer :qualother
      t.integer :stud16to17
      t.integer :stud18plus
      t.integer :ftsemploy
      t.integer :ftsunemp
      t.integer :ftsecinact
      t.integer :ttwhome
      t.integer :ttwtrain
      t.integer :ttwtube
      t.integer :ttwbus
      t.integer :ttwmbike
      t.integer :ttwcar
      t.integer :ttwcarpass
      t.integer :ttwtaxi
      t.integer :ttwbike
      t.integer :ttwfoot
      t.integer :ttwother
      t.integer :pens1pers
      t.integer :other1pers
      t.integer :pensfamily
      t.integer :manokid
      t.integer :madepkid
      t.integer :mandepkid
      t.integer :conokid
      t.integer :codepkid
      t.integer :condepkid
      t.integer :lpdepkid
      t.integer :lpndepkid
      t.integer :othdepkid
      t.integer :allstudent
      t.integer :otherpens
      t.integer :otherhhd
      t.integer :dwunshared
      t.integer :dwshared
      t.integer :detached
      t.integer :semidetach
      t.integer :terrace
      t.integer :flatpur
      t.integer :flatconsha
      t.integer :commbuild
      t.integer :caravmob
      t.integer :ownout
      t.integer :ownmort
      t.integer :ownshare
      t.integer :soccouncil
      t.integer :socother
      t.integer :privrentl
      t.integer :privrento
      t.integer :rentfree
      t.integer :nocars
      t.integer :car1
      t.integer :car2
      t.integer :car3
      t.integer :car4plus
      t.integer :pers1hhd
      t.integer :pers2hhd
      t.integer :pers3hhd
      t.integer :pers4hhd
      t.integer :pers5hhd
      t.integer :pers6hhd
      t.integer :pers7hhd
      t.integer :pers8phhd

      t.timestamps
    end
  end
end