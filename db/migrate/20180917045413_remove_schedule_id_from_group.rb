class RemoveScheduleIdFromGroup < ActiveRecord::Migration[5.1]
  def change
    remove_column :groups, :schedule_id, :integer
  end
end
