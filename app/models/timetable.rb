# == Schema Information
#
# Table name: timetables
#
#  id          :integer          not null, primary key
#  lecture_id  :integer          not null
#  year        :integer          not null
#  term        :string(255)      not null
#  wday        :integer          not null
#  period      :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#  location_id :integer
#

class Timetable < ActiveRecord::Base

  belongs_to :course
  belongs_to :lecture
  belongs_to :location

  validates :year, presence: true
  validates :term, presence: true
  validates :wday, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 7 }
  validates :period, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
