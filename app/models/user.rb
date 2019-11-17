# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  email      :string
#  form       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord 
    validates :username, :password, :email, presence: true
end
