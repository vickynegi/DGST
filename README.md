# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

Ruby version - 2.7.4

Rails version - 7.0.2

Database: postgres

1. please open the development.rb file & paste your 'user_name' & 'password'. In 'user_name', you can paster your email id. We need this to send the email. After this please open the "application_mailer" file & add the paste your email id in "from" key's value.

2. to create the employees, teams and the mapping between employee & team. Run this command
rake db:seed

3. to ask all the employees, an email will be sent to all the employees which will inform them about the invitation
rake employees:offering_out

4. to insert the record in 'blind_dates' table. Please hit this API from Postman:-
  POST call, params are: {"employee_id": 2, "is_available": false, "weekday": "friday"}
  Description:
    "employeed_id": Please check this id in the table and then send it.
    "is_available": true/false - whether that employee would go in lunch or not.
    "weekday": please send 'friday'

5. to give the lunch date information to the employees via email
rake employees:notify

6. please check the EmployeesController & BlindDatesController for the APIs. You will get the action names defined. You will see the parameters & please create the record via postman.

7. 2 view files -
    a) localhost:3000 - To list all the employees
    b) localhost:3000/blind_dates - To list all the blind dates

8. to assigning the leader to the team for a specific lunch date, please check the BlindDates Controller
    PATCH call - localhost:3000/blind_dates/id/assign_leader
    Description: "id" - you can see the id by creating the blind_dates record
