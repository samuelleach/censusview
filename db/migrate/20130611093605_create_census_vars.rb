class CreateCensusVars < ActiveRecord::Migration
  def change
    create_table :census_vars do |t|
      t.integer :variableid
      t.string :varlabel
      t.string :vartype
      t.string :longlabel
      t.string :units

      t.timestamps
    end
  end
end
