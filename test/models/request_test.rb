# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  acc_type   :string
#  reason     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_requests_on_user_id  (user_id)
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
