class AddLocationIdToTimetable < ActiveRecord::Migration
  def change
    add_column :timetables, :location_id, :integer
  end
end
