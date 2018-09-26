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
    content { "MyString" }
    action_type { 1 }
    termination_time { "2018-09-11 17:17:32" }
  end
end
