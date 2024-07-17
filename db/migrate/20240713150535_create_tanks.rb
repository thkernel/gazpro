class CreateTanks < ActiveRecord::Migration[6.1]
  def change
    create_table :tanks do |t|
      t.string :uid
      t.string :registration_number
      t.string :brand
      t.string :model
      t.float :capacity, default: 0.0
      t.references :unity, null: false, foreign_key: true
      t.text :description
      t.string :status
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
