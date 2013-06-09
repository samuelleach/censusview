class CreateCensusVars < ActiveRecord::Migration
  def change
    create_table :census_vars do |t|
      t.integer :VariableID
      t.string :VarLabel
      t.string :LongLabel
      t.string :Units

      t.timestamps
    end
  end
end
