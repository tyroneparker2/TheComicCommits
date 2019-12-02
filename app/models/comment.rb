# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  text       :text
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

class Comment < Post
end
