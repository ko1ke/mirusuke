# == Schema Information
#
# Table name: groups
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  schedule_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ApplicationRecord
  has_many :users, inverse_of: :group, dependent: :destroy
  has_many :schedules, through: :users, inverse_of: :group
  validates :name, presence: true
end
