# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  uid          :string
#  company_name :string
#  first_name   :string
#  last_name    :string
#  civility     :string
#  address      :string
#  country_id   :bigint
#  city         :string
#  phone        :string
#  street       :string
#  po_box       :string
#  zip_code     :string
#  email        :string
#  description  :string
#  status       :string
#  account_id   :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Customer < ApplicationRecord
	include PgSearch::Model
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid
  belongs_to :country


  has_one :account, as: :accountable

  # For active storage
  has_one_attached :avatar


  def full_name
    "#{first_name} #{last_name}"
  end

  def customer_name
    if self.company_name.present?
     "#{company_name}"
    else
      "#{last_name} #{first_name}"
    end
  end

  
  
  # Change default params ID to uid
  def to_param
    uid
  end
end
