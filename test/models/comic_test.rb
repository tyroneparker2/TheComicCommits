# == Schema Information
#
# Table name: comics
#
#  id         :integer          not null, primary key
#  title      :string
#  isbn       :string
#  genre      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  category   :string
#  user_id    :integer
#  series_id  :integer
#
# Indexes
#
#  index_comics_on_series_id  (series_id)
#  index_comics_on_user_id    (user_id)
#

require 'test_helper'

class ComicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
