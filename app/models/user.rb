# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  group           :string
#  username        :string
#  email           :string
#  password_digest :string
#  security_q      :string
#  security_a      :string
#  bio             :string
#  recommendations :string
#  admin_code      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord 
    has_secure_password
    validates :username, :password_digest, :email, presence: true
    validates :email, :username, uniqueness: true
    has_many :posts, dependent: :destroy
    has_many :comics, dependent: :destroy
    has_many :requests, dependent: :destroy
end
