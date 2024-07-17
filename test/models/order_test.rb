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

require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
