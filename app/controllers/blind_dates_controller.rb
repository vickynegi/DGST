class BlindDatesController < ApplicationController
  before_action :find_blind_date, only: [:assign_leader]

  ## list all the blind dates
  def index
    emp_ids = EmployeeTeam.pluck(:employee_id)
    @blind_dates = BlindDate.includes(employee: [:team]).where(employee_id: emp_ids).order(lunch_date: :DESC)
    @restaurant = Restaurant.last
  end

  # creating the blind dates of an employee
  # POST call, params are: {"employee_id": 2, "is_available": false, "weekday": "friday"}
  def create
    return render json: { success: 422, message: 'Please mention the weekday' } if params['weekday'].nil?
    blind_date= BlindDate.new(blind_date_params)
    blind_date.attributes = {restaurant_id: Restaurant.last.id, lunch_date: blind_date.fetch_date(params['weekday'])}
    if blind_date.save
      render json: { message: 'Record has been saved.' }, success: 200
    else
      render json: { errors: blind_date.errors.full_messages }, success: 422
    end
  end

  # assigning the leader to the team for a specific lunch date
  ## PATCH call - localhost:3000/blind_dates/id/assign_leader
  def assign_leader
    if @blind_date.update(is_leader: true)
      render json: { message: "Leader: #{@blind_date.employee.name} has been assigned to the Team: #{@blind_date.employee.team.name} for the lunch date: #{@blind_date.lunch_date} ." }, success: 200
    else
      render json: {errors: @blind_date.errors.full_messages }, success: 422
    end
  end

  private

  def blind_date_params
    params.permit(:employee_id, :is_available)
  end

  def find_blind_date
    @blind_date = BlindDate.find_by(id: params['id'])
    return render(json: {message: 'Blind Date is not found' }, status: :unprocessable_entity) unless @blind_date.present?
  end
end
