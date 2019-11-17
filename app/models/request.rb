# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  acc_type   :string
#  reason     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_requests_on_user_id  (user_id)
#

class Request < ApplicationRecord
    validates :acc_type, :resaon, presence: true
end
