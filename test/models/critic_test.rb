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

require 'test_helper'

class CriticTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
