# == Schema Information
#
# Table name: groups
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :group do
    name { "MyString" }
    user_id { 1 }
    schedule_id { 1 }
  end
end
