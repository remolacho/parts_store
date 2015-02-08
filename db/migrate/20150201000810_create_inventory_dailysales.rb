class CreateInventoryDailysales < ActiveRecord::Migration
  def change
    create_table :dailysales do |t|
      t.string :status, limit: 1, null: false, default: "A"
      t.date :cdate_on, null: false
      t.integer :created_by, null: false, default: 0
      t.integer :updated_by, null: false, default: 0
      t.timestamps
    end
  end
end
