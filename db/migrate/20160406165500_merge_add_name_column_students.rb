require_relative '../config'

# change from first name, last name to name for students

class MergeAddNameColumnStudents < ActiveRecord::Migration
	def change
		# add new name
		add_column :students, :name, :string
		# concatenate first name and last name and insert into name
		Student.all.each do |student|
			student.name = student.first_name + " " + student.last_name
			student.save
		end
		# remove first & last name
  		# remove_column(:students, :first_name, :last_name)
	end
end