class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.timestamp :received_at
      t.integer :quantity
      t.string :firstname
      t.string :lastname
      t.string :telephone
      t.string :email
      t.text :street
      t.integer :zip
      t.string :city
      t.text :comment
      t.boolean :finished
      t.references :offer

      t.timestamps
    end
    add_index :orders, :offer_id
  end
end
