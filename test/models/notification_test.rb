# == Schema Information
#
# Table name: notifications
#
#  id          :integer          not null, primary key
#  message     :string
#  read        :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  follower_id :integer
#  user_id     :integer
#
# Indexes
#
#  index_notifications_on_follower_id  (follower_id)
#  index_notifications_on_user_id      (user_id)
#

require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
