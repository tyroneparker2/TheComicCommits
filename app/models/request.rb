# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  acc_type   :string
#  resaon     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Request < ApplicationRecord
    validates :acc_type, :resaon, presence: true
end
