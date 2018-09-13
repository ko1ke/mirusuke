# == Schema Information
#
# Table name: schedules
#
#  id               :bigint(8)        not null, primary key
#  content          :string
#  action_type      :integer
#  termination_time :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Schedule < ApplicationRecord
  enum action_type: {
      go_out: 0,
      meeting: 1,
      vacation: 2,
      early_leaving: 3,
  }
end
