# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  commenter  :string
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#

class Comment < ApplicationRecord
  belongs_to :post
end
