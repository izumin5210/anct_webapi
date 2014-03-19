class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :title, null: false
      t.string :required_selective, null: false
      t.string :divide, null: false
      t.string :term, null: false
      t.integer :credit, null: false
      t.string :category
      t.text :abstract
      t.text :failure_absence
      t.text :evaluation
      t.text :textbooks

      t.timestamps
    end

    add_index :lectures, :title, unique: true
    add_index :lectures, :required_selective, unique: true
    add_index :lectures, :divide, unique: true
    add_index :lectures, :term, unique: true
    add_index :lectures, :credit, unique: true
  end
end
