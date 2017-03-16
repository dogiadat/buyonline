class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :title
      t.string :url
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps
    end

    add_index :images, [:imageable_type, :imageable_id]
  end
end
