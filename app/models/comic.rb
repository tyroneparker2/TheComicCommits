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

class Comic < ApplicationRecord
    has_one_attached :cover_file
    has_many_attached :comic_file
    belongs_to :series
    belongs_to :user
    has_many :posts, dependent: :destroy
    validates :title, :genre, :category, presence: true
    validates :title, uniqueness: true

end

