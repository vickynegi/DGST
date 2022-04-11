class NotifyEmployeesJob < ApplicationJob
  queue_as :default

  def perform
    ## fetching current week blind dates from last week friday to this week thursday.
    blind_dates = BlindDate.includes(employee: [:team]).where(lunch_date: DateTime.now.beginning_of_week(start_day = :friday)..DateTime.now.end_of_week(start_day = :friday), is_available: true)

    blind_dates.map do |blind_date|
      EmployeeMailer.with(employee_id: blind_date.employee_id, lunch_date: blind_date.lunch_date.strftime("%d-%m-%Y"), restaurant_name: blind_date.restaurant.name, team_name: blind_date.employee.team.name).notifying_employees.deliver_now
    end
  end
end
