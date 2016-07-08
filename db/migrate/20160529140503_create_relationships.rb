class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :patient_id
      t.integer :caregiver_id
      t.timestamps null: false
    end
    add_index :relationships, :patient_id
    add_index :relationships, :caregiver_id
    add_index :relationships, [:patient_id, :caregiver_id], unique: true
  end
end
