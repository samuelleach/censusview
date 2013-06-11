class CensusVar < ActiveRecord::Base
  attr_accessible :longlabel, :units, :variableid, :varlabel
  attr_accessor :tokens
end
