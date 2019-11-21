# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  group           :string
#  username        :string
#  email           :string
#  password        :string
#  security_q      :string
#  security_a      :string
#  bio             :string
#  recommendations :string
#  admin_code      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord 
    has_one_attached :comic_file
    validates :username, :password, :email, presence: true
    has_many :posts, dependent: :destroy
    has_many :comics, dependent: :destroy
    has_many :requests, dependent: :destroy
end
