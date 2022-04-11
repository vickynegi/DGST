class Team < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true, allow_nil: false

  has_many :employee_teams
  has_many :employees, through: :employee_teams
end
