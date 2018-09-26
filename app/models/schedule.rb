# frozen_string_literal: true
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

class Schedule < ApplicationRecord
  belongs_to :user, inverse_of: :schedules

  enum action_type: {
      go_out: 0,
      meeting: 1,
      vacation: 2,
      early_leaving: 3
  }
  validates :action_type, inclusion: action_types.keys
  validate :time_check

  def time_check
    errors.add(:start_time, 'は現在の日時を指定できません') if start_time <= DateTime.now
    errors.add(:termination_time, 'は過去の日時を指定できません') if termination_time <= DateTime.now
    errors.add(:start_time, 'は終了時間より後の日時を指定できません') if start_time > termination_time
  end
end
