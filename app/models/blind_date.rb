class BlindDate < ApplicationRecord
  validates :restaurant_id, :employee_id, :lunch_date, presence: true
  validates_uniqueness_of :lunch_date, scope: [:restaurant_id, :employee_id]

  belongs_to :employee
  belongs_to :restaurant

  validate :check_leader, on: :update

  def fetch_date(weekday)
    date = Date.parse(weekday)
    day_no = date > Date.today ? 0 : 7
    date + day_no
  end

  private

  ## checking whether existing leader is already present in that weekend
  def check_leader
    if self.changes.has_key?("is_leader")
      records = BlindDate.where(lunch_date: lunch_date, is_leader: true)
      if records.exists?
        errors.add(:base, "Already Team leader: #{records[0].employee.name} is assigned for this lunch date: #{lunch_date}")
      end
    end
  end
end
