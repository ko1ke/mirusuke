class AddStartTimeToSchedules < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :start_time, :datetime, default: -> { 'NOW()' }
  end
end
