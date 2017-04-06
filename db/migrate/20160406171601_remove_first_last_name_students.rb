require_relative '../config'

# change from first name, last name to name for students

class RemoveFirstLastNameStudents < ActiveRecord::Migration
	def up
		# remove first & last name + existing data
  		remove_column(:students, :first_name)
  		remove_column(:students, :last_name)
	end

	def down
		# add back the column
		add_column(:students, :first_name, :string)
		add_column(:students, :last_name, :string)
		# optain data in name
		Student.all.each do |student|
			arr = student.name.split(" ", 2)
			student.first_name = arr[0]
			student.last_name = arr[1]
			student.save
		end
	end
end