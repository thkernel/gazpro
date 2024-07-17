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

require "test_helper"

class ProductionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
