require_relative '../config'

class CreateStudentTeachers < ActiveRecord::Migration
	def change
		create_table :studentteachers do |t|
			t.integer :student_id
			t.integer :teacher_id
		end
	end
end
