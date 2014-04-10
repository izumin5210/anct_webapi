class FixIndex < ActiveRecord::Migration
  def change
    add_index :timetables, [:term, :year]
    add_index :lectures, [:course_id]
  end
end
