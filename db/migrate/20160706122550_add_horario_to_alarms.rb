class AddHorarioToAlarms < ActiveRecord::Migration
  def change
    add_column :alarms, :horario, :datetime
  end
end
