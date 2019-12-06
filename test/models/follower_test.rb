# == Schema Information
#
# Table name: followers
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  following_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_followers_on_following_id  (following_id)
#  index_followers_on_user_id       (user_id)
#

require 'test_helper'

class FollowerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
