class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :lecturers, :name, unique: true
  end
end
