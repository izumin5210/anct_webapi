class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :lecture_id, null: false
      t.integer :department_id, null: false
      t.integer :course_id
      t.integer :year, null: false
      t.string :term, null: false
      t.integer :wday, null: false
      t.integer :period, null: false
      t.integer :grade, null: false

      t.timestamps
    end
    add_index :timetables, :lecture_id
    add_index :timetables, :department_id
    add_index :timetables, [:department_id, :course_id, :grade, :year], name: 'index_timetables_on_class'
    add_index :timetables, [:year, :term, :period, :wday, :grade, :department_id, :course_id], unique: true, name: 'index_timetables_on_cell'
  end
end
