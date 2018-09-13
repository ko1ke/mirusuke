class RenameColumnOnSchedule < ActiveRecord::Migration[5.1]
  def change
    rename_column :schedules, :action_type, :action_type
  end
end
