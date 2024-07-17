# == Schema Information
#
# Table name: tanks
#
#  id                  :bigint           not null, primary key
#  uid                 :string
#  registration_number :string
#  brand               :string
#  model               :string
#  capacity            :float            default(0.0)
#  unity_id            :bigint           not null
#  description         :text
#  status              :string
#  account_id          :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Tank < ApplicationRecord
  # Include shared utils.
  include SharedUtils::Generate

  before_save :generate_random_number_uid

  belongs_to :unity
  belongs_to :account

  # Change default params ID to uid
  def to_param
    uid
  end

  
end
