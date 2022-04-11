class Employee < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true, allow_nil: false

  has_one :employee_team
  has_one :team, through: :employee_team

  accepts_nested_attributes_for :employee_team, allow_destroy: true
end
