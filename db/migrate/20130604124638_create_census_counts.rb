class CreateCensusCounts < ActiveRecord::Migration
  def change
    create_table :census_counts do |t|
      t.string :area_id
      t.integer :male
      t.integer :female
      t.integer :totpop
      t.integer :tot16to74
      t.integer :totadult
      t.integer :totemploy

      t.timestamps
    end
  end
end
