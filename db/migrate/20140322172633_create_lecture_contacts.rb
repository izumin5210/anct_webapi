class CreateLectureContacts < ActiveRecord::Migration
  def change
    create_table :lecture_contacts do |t|
      t.integer :lecture_id, null: false
      t.integer :contact_id, null: false

      t.timestamps
    end

    add_index :lecture_contacts, [:lecture_id, :contact_id], unique: true
  end
end
