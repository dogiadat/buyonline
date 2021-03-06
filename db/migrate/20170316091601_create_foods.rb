class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :price
      t.integer :restaurant_id
      t.integer :order_count
      t.integer :status
      t.boolean :is_sale
      t.text :description
      t.string :url_avatar
      t.integer :category_id

      t.timestamps
    end
  end
end
