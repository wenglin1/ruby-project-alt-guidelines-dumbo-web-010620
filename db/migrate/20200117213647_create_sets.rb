class CreateSets < ActiveRecord::Migration[5.2]
  def change
    create_table :sets do |t|
      t.integer :dj_id
      t.integer :festival_id
      t.date :date
     
      t.timestamps
    end
  end
end
