class CreateInventoryBuys < ActiveRecord::Migration
  def change
    create_table :buys do |t|
      t.references :item, index: true,  null: false
      t.text :description
      t.integer :quantity, null: true, default: 0
      t.float :buyprice, null: false, default: 0
      t.string :status, limit: 1, null: false, default: "A"
      t.date :cdate_on, null: false
      t.integer :created_by, null: false, default: 0
      t.integer :updated_by, null: false, default: 0
      t.timestamps
    end
  end
end
