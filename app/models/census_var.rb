class CensusVar < ActiveRecord::Base
  attr_accessible :longlabel, :units, :variableid, :varlabel, :vartype
  attr_accessor :tokens
end
