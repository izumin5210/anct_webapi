class RemoveDepartmentAndCourseFromTimetable < ActiveRecord::Migration
  def change
    remove_index :timetables, :department_id
    remove_index :timetables, name: 'index_timetables_on_class'
    remove_index :timetables, name: 'index_timetables_on_cell'
    remove_column :timetables, :grade, :integer
    remove_column :timetables, :department_id, :integer
    remove_column :timetables, :course_id, :integer
    add_index :timetables, [:year, :wday]
    add_index :timetables, [:year, :wday, :period]
  end
end
