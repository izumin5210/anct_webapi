# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  abbr       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Department < ActiveRecord::Base

  has_many :timetables
  has_many :lectures, through: :timetables

  validates :name, presence: true, uniqueness: true
  validates :abbr, presence: true, uniqueness: true
end
