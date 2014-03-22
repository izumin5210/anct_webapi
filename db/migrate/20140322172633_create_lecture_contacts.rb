class CreateLectureContacts < ActiveRecord::Migration
  def change
    create_table :lecture_contacts do |t|
      t.integer :lecture_id
      t.integer :contact_id

      t.timestamps
    end
  end
end
