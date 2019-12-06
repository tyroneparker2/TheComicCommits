# == Schema Information
#
# Table name: series
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_series_on_user_id  (user_id)
#

class Series < ApplicationRecord
    has_many :comics, dependent: :destroy
    validates :title, presence: true
    validates :title, uniqueness: true
    belongs_to :user
end
