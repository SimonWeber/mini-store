class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.text :description
      t.timestamp :created_at
      t.integer :quantity
      t.decimal :cost
      t.boolean :active

      t.timestamps
    end
  end
end
