class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :post_id
      t.text :body
      t.string :color
      t.string :phone_number
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :orders, :post_id
  end
end
