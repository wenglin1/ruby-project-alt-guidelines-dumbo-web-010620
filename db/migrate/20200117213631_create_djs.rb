class CreateDjs < ActiveRecord::Migration[5.2]
  def change
    create_table :dj do |t|
      t.string :name
      t.string :genre
      t.integer :rate
    end
  end
end
