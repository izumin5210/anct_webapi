class CreateLectureLecturers < ActiveRecord::Migration
  def change
    create_table :lecture_lecturers do |t|
      t.integer :lecture_id, null: false
      t.integer :lecturer_id, null: false

      t.timestamps
    end

    add_index :lecture_lecturers, [:lecture_id, :lecturer_id], unique: true
  end
end
