class CreateDjs < ActiveRecord::Migration[5.2]
    def change
      create_table :djs do |t|
        t.string :name
        t.string :genre
        t.integer :rate
      end
  end
end
