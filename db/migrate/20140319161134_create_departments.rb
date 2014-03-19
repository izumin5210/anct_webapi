class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :abbr, null: false

      t.timestamps
    end

    add_index :departments, :name, unique: true
    add_index :departments, :abbr, unique: true
  end
end
