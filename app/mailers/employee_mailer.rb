class EmployeeMailer < ApplicationMailer
  
  def offering_out_to_employees
    emp_id = params[:employee_id]
    @employee = Employee.find_by(id: emp_id)
    mail(to: @employee.email, subject: "You got a new email!")
  end

  def notifying_employees
    emp_id = params[:employee_id]
    @lunch_date = params[:lunch_date]
    @restaurant_name = params[:restaurant_name]
    @employee = Employee.find_by(id: emp_id)
    @team_name = params[:team_name]
    mail(to: @employee.email, subject: "You got an invitation!")
  end
end
