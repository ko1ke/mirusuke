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


class Schedule < ApplicationRecord
  enum action_type: {
      go_out: 0,
      meeting: 1,
      vacation: 2,
      early_leaving: 3,
  }
  validates :action_type, inclusion: action_types.keys
  validate :time_check

  def time_check
    if self.termination_time <= DateTime.now
      errors.add(:termination_time, "は現在より過去の日時を指定できません")
    end
  end


  def format_time
    self.termination_time.strftime('%Y/%m/%d %H:%M')
  end


end
