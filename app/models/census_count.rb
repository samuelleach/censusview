class CensusCount < ActiveRecord::Base
  attr_accessible :area_id, :female, :male, :tot16to74, :totadult, :totemploy, :totpop
end
