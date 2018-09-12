class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.string :content
      t.integer :plan_type
      t.datetime :termination_time

      t.timestamps
    end
  end
end
