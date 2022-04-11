class CreateBlindDates < ActiveRecord::Migration[7.0]
  def change
    create_table :blind_dates do |t|
      t.integer :restaurant_id
      t.integer :employee_id
      t.datetime :lunch_date
      t.boolean :is_leader, default: false
      t.boolean :is_available, default: false

      t.timestamps
    end
  end
end
