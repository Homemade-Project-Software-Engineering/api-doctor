class CreateCuidas < ActiveRecord::Migration
  def change
    create_table :cuidas do |t|
      t.integer :paciente_id
      t.integer :cuidador_id

      t.timestamps null: false
    end
s
    add_index :cuidas, :paciente_id
    add_index :cuidas, :cuidador_id
    add_index :cuidas, [:paciente_id, :cuidador_id], unique: true
  end
end
