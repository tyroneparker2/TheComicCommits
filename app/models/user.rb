# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  type            :string
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
    has_many :comics, dependent: :destroy
    has_many :posts, dependent: :destroy
    has_many :requests, dependent: :destroy
end
