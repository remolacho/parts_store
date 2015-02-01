class CreateInventoryCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :longname, limit: 50, null: false
      t.string  :shortname, limit: 5, null: false
      t.string  :status, limit: 1, null: false, default: "A"
      t.timestamps
    end
  end
end
