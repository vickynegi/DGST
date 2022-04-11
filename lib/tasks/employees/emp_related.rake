namespace :employees do
  desc 'for asking out to employees'
  task offering_out: :environment do
    puts "Start"
    controller_obj = EmployeesController.new
    controller_obj.offering_out
    puts "Success"
  end

  desc 'to give the lunch date information'
  task notify: :environment do
    puts "Start"
    controller_obj = EmployeesController.new
    controller_obj.notify
    puts "Success"
  end
end
