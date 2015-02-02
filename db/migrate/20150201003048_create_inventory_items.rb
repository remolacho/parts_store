class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :category, index: true,  null: false
      t.string :name, null: false, limit: 50
      t.text :description
      t.float :costprice, null: false, default: 0
      t.float :saleprice, null: false, default: 0
      t.string :status, limit: 1, null: false, default: "A"
      t.date :cdate, null: false
      t.integer :created_by, null: false, default: 0
      t.integer :updated_by, null: false, default: 0
      t.timestamps
    end

  end
end
