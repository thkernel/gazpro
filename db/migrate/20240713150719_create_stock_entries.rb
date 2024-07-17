class CreateStockEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_entries do |t|
      t.string :uid
      t.datetime :receipt_date
      t.references :product, null: false, foreign_key: true
      t.string :delivery_note_number
      t.references :tank, null: false, foreign_key: true
      t.string :driver
      t.string :origin
      t.float :quantity, default: 0.0
      t.references :unity, null: false, foreign_key: true
      t.text :description
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
