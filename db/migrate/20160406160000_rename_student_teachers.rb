require_relative '../config'

# if my class in models is called StudentTeacher, your table needs to be student_teachers! Because of the caps on Teachers


class RenameStudentTeachers < ActiveRecord::Migration
	def change
  		rename_table :studentteachers, :student_teachers
	end
end

