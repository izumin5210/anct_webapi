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

    add_index :lectures, :title
    add_index :lectures, :required_selective
    add_index :lectures, :divide
    add_index :lectures, :term
    add_index :lectures, :credit
  end
end
