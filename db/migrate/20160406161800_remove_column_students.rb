require_relative '../config'

# Populated Joint Table with teacher_id in student table, now to delete column

# remove_column(:table_name, :column_name)

class RemoveColumnStudents < ActiveRecord::Migration
	def change
  		remove_column(:students, :teacher_id)
	end
end