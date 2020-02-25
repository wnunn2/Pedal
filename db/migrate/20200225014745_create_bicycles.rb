class CreateBicycles < ActiveRecord::Migration[5.2]
  def change
    create_table :bicycles do |t|
      t.string :category
      t.integer :day_price
      t.string :brand
      t.string :condition
      t.string :description
      t.references :user, foreign_key: true
      t.string :address

      t.timestamps
    end
  end
end
