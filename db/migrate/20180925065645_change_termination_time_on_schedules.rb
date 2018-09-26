class ChangeTerminationTimeOnSchedules < ActiveRecord::Migration[5.1]
  def up
    change_column :schedules, :termination_time, :datetime, default: -> { 'NOW()' }
  end

  def down
    change_column :schedules, :termination_time, :datetime
  end
end
