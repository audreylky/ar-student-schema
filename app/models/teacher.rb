require_relative '../../db/config'

class Teacher < ActiveRecord::Base
	validates :email, uniqueness: true, format: { with: /.@.+\...+/, message: "this is not a valid email" }

	# has_many :students
	has_many :student_teachers
	has_many :students, through: :student_teachers
end

