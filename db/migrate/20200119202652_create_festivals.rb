class CreateFestivals < ActiveRecord::Migration[5.2]
  def change
    create_table :festivals do |t|
      t.integer :promoter_id
      t.string :name
      t.string :location
      t.integer :budget
      t.date :date

      t.timestamps
    end
  end
end
