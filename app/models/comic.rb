# == Schema Information
#
# Table name: comics
#
#  id         :integer          not null, primary key
#  title      :string
#  comic_file :string
#  isbn       :string
#  genre      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_comics_on_user_id  (user_id)
#

class Comic < ApplicationRecord
    belongs_to :user
    has_many :posts, dependent: :destroy
end
