class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.string :abbr, null: false

      t.timestamps
    end

    add_index :courses, :name, unique: true
    add_index :courses, :abbr, unique: true
  end
end
