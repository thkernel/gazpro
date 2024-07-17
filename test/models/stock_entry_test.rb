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

require "test_helper"

class StockEntryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
