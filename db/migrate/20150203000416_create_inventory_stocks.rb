class CreateInventoryStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
        t.references :item, index: true,  null: false
        t.integer    :existence, null: false, default: 0
        t.integer    :existence_back, null: false, default: 0
        t.string     :status, limit: 1, null: false, default: "A"
        t.date       :cdate_on, null: false
        t.date       :udate_on, null: false
        t.integer    :created_by, null: false, default: 0
        t.integer    :updated_by, null: false, default: 0
      
        t.timestamps
    end
  end
end
