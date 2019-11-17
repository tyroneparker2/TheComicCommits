# == Schema Information
#
# Table name: users
#
<<<<<<< HEAD
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
=======
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  email      :string
#  form       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
>>>>>>> testing
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
