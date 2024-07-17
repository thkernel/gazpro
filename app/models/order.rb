# == Schema Information
#
# Table name: orders
#
#  id                   :bigint           not null, primary key
#  uid                  :string
#  order_date           :datetime
#  customer_id          :bigint           not null
#  transporter          :string
#  delivery_note_number :string
#  entry_b3             :float            default(0.0)
#  entry_b6             :float            default(0.0)
#  entry_b12            :float            default(0.0)
#  entry_b32            :float            default(0.0)
#  entry_b38            :float            default(0.0)
#  out_b3               :float            default(0.0)
#  out_b6               :float            default(0.0)
#  out_b12              :float            default(0.0)
#  out_b32              :float            default(0.0)
#  out_b38              :float            default(0.0)
#  total_tonnage        :float            default(0.0)
#  status               :string
#  account_id           :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Order < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :set_status, :set_total_tonnage

  belongs_to :customer
  belongs_to :account

  

  # Change default params ID to uid
  def to_param
    uid
  end

   def set_status
      unless self.status.present?
        self.status = "Validée"
      end

      
    end

    def set_total_tonnage
      self.total_tonnage = ((self.out_b3 * 2.75)/1000) + ((self.out_b6 * 6)/1000) + ((self.out_b12 * 12.5)/1000) + ((self.out_b32 * 32)/1000) + ((self.out_b38 * 38)/1000)
    end

    # Search by customer
  def self.search_by_customer(start_date, end_date,  customer)  
    query = Order.order(:created_at)
    query = query.where("DATE(created_at) BETWEEN ? AND ? ", start_date, end_date) if start_date.present? and  end_date.present?
    query = query.where("customer_id =  ?", customer) if customer.present?
   
     
    query
        
       
  end

  def set_current_stock

    product = Product.find_by(name: "GAZ")
    
    if self.current_stock >= self.total_tonnage
      current_stock = (product.current_stock - self.total_tonnage) if product.present?
      product.update(current_stock: current_stock)
    else

    end
  end

  
end
