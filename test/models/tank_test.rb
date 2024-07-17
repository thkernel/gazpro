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

require "test_helper"

class TankTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
