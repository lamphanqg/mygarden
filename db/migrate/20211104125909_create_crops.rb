class CreateCrops < ActiveRecord::Migration[6.1]
  def change
    create_table :crops do |t|
      t.string :plant_name, null: false
      t.date :started_at
      t.date :ended_at
      t.integer :quantity
      t.integer :area

      t.timestamps
    end
    add_index :crops, :plant_name
    add_index :crops, :started_at
    add_index :crops, :ended_at
  end
end
