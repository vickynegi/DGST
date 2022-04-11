class CreateEmployeeTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_teams do |t|
      t.integer :employee_id
      t.integer :team_id

      t.timestamps
    end
  end
end
