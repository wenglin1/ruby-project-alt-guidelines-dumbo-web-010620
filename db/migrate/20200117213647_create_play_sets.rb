class CreatePlaySets < ActiveRecord::Migration[5.2]
  def change
    create_table :play_sets do |t|
      t.integer :dj_id
      t.integer :festival_id
      t.integer :duration
     
      t.timestamps
    end
  end
end