class CreateProductions < ActiveRecord::Migration[6.1]
  def change
    create_table :productions do |t|
      t.string :uid
      t.datetime :production_date
      t.float :quantity, default: 0.0
      t.float :b3_number, default: 0.0
      t.float :b3_tonnage, default: 0.0
      t.float :b6_number, default: 0.0
      t.float :b6_tonnage, default: 0.0
      t.float :b12_number, default: 0.0
      t.float :b12_tonnage, default: 0.0
      t.float :b32_number, default: 0.0
      t.float :b32_tonnage, default: 0.0
      t.float :b38_number, default: 0.0
      t.float :b38_tonnage, default: 0.0
      t.float :total_tonnage, default: 0.0
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
