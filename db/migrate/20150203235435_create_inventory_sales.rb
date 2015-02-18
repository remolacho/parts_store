class CreateInventorySales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :item, index: true, null: false
      t.references :dailysale, index: true,  null: false
      t.float   :amount, default: 0
      t.float   :amount_cost, default: 0
      t.integer :quantity, default: 0
      t.date    :cdate_on, null: false
      t.string  :status, limit: 1, null: false, default: "A"
      t.integer :created_by, null: false, default: 0
      t.integer :updated_by, null: false, default: 0
      t.timestamps
    end
  end
end
