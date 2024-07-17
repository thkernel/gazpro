class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :uid
      t.datetime :order_date
      t.references :customer, null: false, foreign_key: true
      t.string :transporter
      t.string :delivery_note_number
      t.float :entry_b3, default: 0.0
      t.float :entry_b6, default: 0.0
      t.float :entry_b12, default: 0.0
      t.float :entry_b32, default: 0.0
      t.float :entry_b38, default: 0.0
      t.float :out_b3, default: 0.0
      t.float :out_b6, default: 0.0
      t.float :out_b12, default: 0.0
      t.float :out_b32, default: 0.0
      t.float :out_b38, default: 0.0
      t.float :total_tonnage, default: 0.0
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
