require_relative '../config'

# this is where you should use an ActiveRecord migration to

class AddColumnStudents < ActiveRecord::Migration
  def change
    # where i go, what i put, what type
    add_column :students, :teacher_id, :integer
      # add columns that you would need for this table
  end
end