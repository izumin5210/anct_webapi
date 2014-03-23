# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base

  has_many :timetables

  validates :name, presence: true, uniqueness: true
end
