class AddGradeAndDepartmentAndCourseToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :grade, :integer
    add_column :lectures, :department_id, :integer
    add_column :lectures, :course_id, :integer

    change_column :lectures, :grade, :integer, null: false
    change_column :lectures, :department_id, :integer, null: false

    add_index :lectures, :grade
    add_index :lectures, :department_id
    add_index :lectures, [:grade, :department_id]
    add_index :lectures, [:grade, :department_id, :course_id]
  end
end
