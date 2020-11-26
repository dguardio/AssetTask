class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.string :buyer_email
      t.string :product_class
      t.integer :product_id

      t.timestamps
    end
  end
end
