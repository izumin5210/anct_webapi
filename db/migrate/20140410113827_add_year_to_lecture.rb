class AddYearToLecture < ActiveRecord::Migration
  def change
    add_column :lectures, :year, :integer
  end
end
