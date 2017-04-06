require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'
require_relative 'app/models/teacher'
require_relative 'app/models/studentteacher'

desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the students database with sample data"
task "db:populate" do
  StudentsImporter.import
end

desc "populate the teachers database with sample data"
task "db:populate_teacher" do
  # Create some teachers for your teachers table in database
  teachers_info = [
    ['Audrey Ling', Time.new(1988,3,13), 'audrey@next.com', '123-123-1234', '12, ss18/6, MY' ], 
    ['Sophia', Time.new(1989,4,13), 'sophia@next.com', '123-123-1234', '12, ss18/6, MY' ], 
    ['Francis', Time.new(1990,5,13), 'francis@next.com', '123-123-1234', '12, ss18/6, MY' ], 
    ['Ming Hao', Time.new(1991,6,13), 'mh@next.com', '123-123-1234', '12, ss18/6, MY' ], 
    ['Michelle', Time.new(1992,7,13), 'Michelle@next.com', '123-123-1234', '12, ss18/6, MY' ], 
    ['Hussien', Time.new(1993,8,13), 'Hussien@next.com', '123-123-1234', '12, ss18/6, MY' ], 
    ['Naoto', Time.new(1994,9,13), 'Naoto@next.com', '123-123-1234', '12, ss18/6, MY' ], 
    ['Joseph', Time.new(1995,10,13), 'Joseph@next.com', '123-123-1234', '12, ss18/6, MY' ], 
    ['Jim', Time.new(1996,11,13), 'Jim@next.com', '123-123-1234', '12, ss18/6, MY' ], 
  ]

  teachers_info.each do |row|
    # always CREATE!!
    Teacher.create(name: row[0], birthday: row[1], email: row[2], phone: row[3], address: row[4])
  end
end

desc "each students will have a teacher"
task "db:assign_teacher" do
  Student.all.each do |student|
    student.update(teacher_id:rand(1..Teacher.count))
  end
end

desc "populate studentteachers joint table with existing data on students table"
task "db:populate_student_teachers" do
  Student.all.each do |student|
    # YOU MUST SAVE IF YOU CREATE NEW
    # StudentTeacher.new(student_id: student.id, teacher_id: student.teacher_id)
    StudentTeacher.createexit(student_id: student.id, teacher_id: student.teacher_id)
  end
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
