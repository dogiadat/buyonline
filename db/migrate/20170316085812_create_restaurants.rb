class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :min_price
      t.integer :max_price
      t.integer :manager_id
      t.integer :status
      t.string :open_time
      t.string :close_time
      t.integer :order_count, default: 0
      t.integer :free_delivery_fee
      t.integer :delivery_fee
      t.string :website
      t.string :email
      t.string :url_avatar
      t.float :lat
      t.float :long
      t.text :description
      t.integer :min_order

      t.timestamps
    end
  end
end
