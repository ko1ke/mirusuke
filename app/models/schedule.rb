# == Schema Information
#
# Table name: schedules
#
#  id               :bigint(8)        not null, primary key
#  content          :string
#  plan_type        :integer
#  termination_time :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Schedule < ApplicationRecord
  # enum pay_type: {
  #     "Check" => 0,
  #     "Credit card" => 1,
  #     "Purchase order" => 2
  # }
end
