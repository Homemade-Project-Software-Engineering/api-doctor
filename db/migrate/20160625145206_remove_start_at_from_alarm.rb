class RemoveStartAtFromAlarm < ActiveRecord::Migration
  def change
    remove_column :alarms, :start_at, :time
  end
end
