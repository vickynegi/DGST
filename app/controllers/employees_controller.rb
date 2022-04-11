class EmployeesController < ApplicationController
  before_action :find_team, only: [:create]

  def index
    @employees  = Employee.all
  end

  ## to create an employee & assign him a team
  ## Post API - {"employee":{"name": "tony", "email": "tony12@yopmail.com", "team": "Team B"}}
  def create
    params['employee']['employee_team_attributes'] = {'team_id': @team.id}
    emp = Employee.new(emp_params)
    if emp.save
      render json: { message: "Employee: #{emp.name} has been saved." }, success: 200
    else
      render json: { errors: emp.errors.full_messages }, success: 422
    end
  end

  ## API to ask the employee about the invitation
  def offering_out
    OfferingOutEmployeesJob.perform_now
  end

  ## API to give the lunch date information
  def notify
    NotifyEmployeesJob.perform_now
    render json: { message: 'Email will be sent. It may take some time.' }, success: 200
  end

  private

  def find_team
    @team = Team.find_by(name: params['employee']['team'])
    return render(json: {message: 'Team is not found' }, status: :unprocessable_entity) unless @team.present?
  end

  def emp_params
    params.require(:employee).permit(:name, :email, employee_team_attributes: [:team_id])
  end
end
