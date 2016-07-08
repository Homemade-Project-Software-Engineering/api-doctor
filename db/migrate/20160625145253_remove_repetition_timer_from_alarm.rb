class RemoveRepetitionTimerFromAlarm < ActiveRecord::Migration
  def change
    remove_column :alarms, :repetition_timer, :time
  end
end
