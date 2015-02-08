class CreateInventoryDailyclosures < ActiveRecord::Migration
  def change
    create_table :dailyclosures do |t|
      t.references :dailysale, index: true,  null: false
      t.float   :total_amount_sale, null: false, default: 0
      t.float   :total_amount_costo, null: false, default: 0
      t.float   :total_amount_gain, null: false, default: 0
      t.date    :cdate_on, null: false
      t.string  :status, limit: 1, null: false, default: "A"
      t.integer :created_by, null: false, default: 0
      t.integer :updated_by, null: false, default: 0
      t.timestamps
    end
  end
end
