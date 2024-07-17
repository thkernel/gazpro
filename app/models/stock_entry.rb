# == Schema Information
#
# Table name: stock_entries
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  receipt_date         :datetime
#  product_id           :bigint           not null
#  delivery_note_number :string
#  tank_id              :bigint           not null
#  driver               :string
#  origin               :string
#  quantity             :float            default(0.0)
#  unity_id             :bigint           not null
#  description          :text
#  status               :string
#  account_id           :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class StockEntry < ApplicationRecord
  
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :set_current_stock
  
  belongs_to :product
  belongs_to :tank
  belongs_to :unity
  belongs_to :account

  # Change default params ID to uid
  def to_param
    uid
  end

    # Search by customer
  def self.search_by_customer(start_date, end_date,  product)  
    query = StockEntry.order(:created_at)
    query = query.where("DATE(created_at) BETWEEN ? AND ? ", start_date, end_date) if start_date.present? and  end_date.present?
    query = query.where("product_id =  ?", product) if product.present?
   
     
    query
        
       
  end



  def set_current_stock
    product = Product.find(self.product_id)

    puts "QUANTITY: #{self.quantity}"
    puts "CURRENT STOCK: #{product.current_stock}"
    current_stock = (product.current_stock + self.quantity) if product.present?
    product.update(current_stock: current_stock)
  end

  
end
