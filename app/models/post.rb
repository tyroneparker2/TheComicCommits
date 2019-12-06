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
#  poster     :string
#
# Indexes
#
#  index_posts_on_comic_id  (comic_id)
#  index_posts_on_user_id   (user_id)
#

class Post < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :comic, optional: true 

    has_many :comments
    validates :title, presence: true,
                      length: { minimum: 5 }
  
end
