class NotifyEmployeesJob < ApplicationJob
  queue_as :default

  def perform
    Employee.all.map do |emp|
      EmployeeMailer.with(employee_id: emp.id).offering_out_to_employees.deliver_now
    end
  end
end
