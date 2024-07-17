# == Schema Information
#
# Table name: productions
#
#  id              :bigint           not null, primary key
#  uid             :string
#  production_date :datetime
#  quantity        :float            default(0.0)
#  b3_number       :float            default(0.0)
#  b3_tonnage      :float            default(0.0)
#  b6_number       :float            default(0.0)
#  b6_tonnage      :float            default(0.0)
#  b12_number      :float            default(0.0)
#  b12_tonnage     :float            default(0.0)
#  b32_number      :float            default(0.0)
#  b32_tonnage     :float            default(0.0)
#  b38_number      :float            default(0.0)
#  b38_tonnage     :float            default(0.0)
#  total_tonnage   :float            default(0.0)
#  status          :string
#  account_id      :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Production < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid, :set_total_tonnage

  belongs_to :account

  validates_with StockExitValidator::StockReduceValidator


  # Change default params ID to uid
  def to_param
    uid
  end


   # Search by customer
  def self.search_by_customer(start_date, end_date)  
    query = Production.order(:created_at)
    query = query.where("DATE(created_at) BETWEEN ? AND ? ", start_date, end_date) if start_date.present? and  end_date.present?
    
     
    query
        
       
  end
  private

  

  def set_total_tonnage
    #b3_tonnage = 
    #b6_tonnage = 
    #b12_tonnage =
    #b32_tonnage =
    #b38_tonnage =

    self.b3_tonnage = (self.b3_number * 2.75) / 1000
    self.b6_tonnage = (self.b6_number * 6) / 1000
    self.b12_tonnage = (self.b12_number * 12.5) / 1000
    self.b32_tonnage = (self.b32_number * 32) / 1000
    self.b38_tonnage = (self.b38_number * 38) / 1000

    self.total_tonnage = self.b3_tonnage + self.b6_tonnage + self.b12_tonnage + self.b32_tonnage + self.b38_tonnage

  end

  
end
