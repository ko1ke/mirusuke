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
#  user_id          :integer
#  start_time       :datetime
#

FactoryBot.define do
  factory :schedule do
    content {"My schedule"}
    action_type {1}
    user_id {1}
    start_time {DateTime.now + 1.0/24}
    termination_time {DateTime.now + 2.0/24}
  end
end
