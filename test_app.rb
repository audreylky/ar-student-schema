#require files
require_relative 'app/models/teacher.rb'
require_relative 'app/models/student.rb'

# Write test code
#################
Student.all
# Given a student, can you find a teacher? 
student = Student.find(66)
private_teacher = student.teacher_id
p teacher = Teacher.find(private_teacher)

# Can you find all of her students?

p students = Student.where(private_teacher)