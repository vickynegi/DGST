class EmployeeTeam < ApplicationRecord
  validates  :team_id, presence: true
  validates_uniqueness_of :employee_id, scope: :team_id

  belongs_to :team
  belongs_to :employee
end
