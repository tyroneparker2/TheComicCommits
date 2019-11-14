# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  type       :string
#  text       :text
#  rating     :integer
#  replied_to :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comic_id   :integer
#  user_id    :integer
#
# Indexes
#
#  index_posts_on_comic_id  (comic_id)
#  index_posts_on_user_id   (user_id)
#

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
