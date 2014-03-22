class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :lecture_id, null: false
      t.integer :number, null: false
      t.string :title
      t.text :detail

      t.timestamps
    end

    add_index :plans, :lecture_id
    add_index :plans, :number
  end
end
