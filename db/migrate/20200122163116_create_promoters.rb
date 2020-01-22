class CreatePromoters < ActiveRecord::Migration[5.2]
  def change
    create_table :promoters do |t|
      t.string :name
    end
  end
end
