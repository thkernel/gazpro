json.extract! stock_entry, :id, :uid, :receipt_date, :product_id, :delivery_note_number, :tank_id, :driver, :quantity, :unity_id, :description, :status, :account_id, :created_at, :updated_at
json.url stock_entry_url(stock_entry, format: :json)
