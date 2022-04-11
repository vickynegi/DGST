## creating the Restaurant
res=Restaurant.where(name: "Ancient Barbique").first_or_create!
p "Restaurant #{res.name} has been saved"

## creating the Employees
[{"name": "Rohan", "email": "v111negi@gmail.com"}, {"name": "Vivek", "email": "v_111negi@yahoo.com"}, {"name": "Negi", "email": "vivek_analyst@icloud.com"}, {"name": "KT", "email": "kt@gmail.com"}].map do |record|
  emp = Employee.new(email: record[:email])
  emp.name = record[:name]
  if emp.save
  	p "Employee: #{emp.name} has been saved."
  else
  	p emp.errors.full_messages
  end
end

## creating the teams
[{"name": "Team A"}, {"name": "Team B"}].map do |record|
  team = Team.new(name: record[:name])
  if team.save
  	p "#{team.name} has been saved."
  else
  	p team.errors.full_messages
  end
end

## linking an employee & a team
team1 = Team.find_by("name": "Team A")
team2 = Team.find_by("name": "Team B")
Employee.all[0..1].map do |emp|
  EmployeeTeam.where(employee_id: emp.id, team_id: team1.id).first_or_create!
  p "#{emp.name} is in #{team1.name}"
end

Employee.all[2..3].map do |emp|
  EmployeeTeam.where(employee_id: emp.id, team_id: team2.id).first_or_create!
  p "#{emp.name} is in #{team2.name}"
end
