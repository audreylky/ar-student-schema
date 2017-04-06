require_relative '../../db/config'

class Student < ActiveRecord::Base
# implement your Student model here
  validates :email, format: { with: /.@.+\...+/, message: "this is not a valid email" }, uniqueness: true
  validates :age, numericality: { greater_than: 5 }
  validates :phone, format: { with: /.*\d{3}.*\d{3}.*\d{4}.*/, message: "this is not a valid phone" }

  # belongs_to :teachers
	has_many :student_teachers
	has_many :teachers, through: :student_teachers


	def name
		name = self.first_name + " " + self.last_name
	end

	def age
		age = Date.today.year - self.birthday.year

		if self.birthday.month == Date.today.month && self.birthday.day > Date.today.day  # same birthday month, but haven't reach bday date!
			age -= 1
		elsif self.birthday.month > Date.today.month 	# haven't reach birthday month yet
			age -= 1
		else
			age
		end
	end
end