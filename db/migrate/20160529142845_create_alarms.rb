class CreateAlarms < ActiveRecord::Migration
  def change
    create_table :alarms do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.time :start_at
      t.integer :repetition_timer
      t.boolean :checked
      t.timestamps null: false
    end
  end
end
