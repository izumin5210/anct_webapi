# == Schema Information
#
# Table name: timetables
#
#  id            :integer          not null, primary key
#  lecture_id    :integer          not null
#  department_id :integer          not null
#  course_id     :integer
#  year          :integer          not null
#  term          :string(255)      not null
#  wday          :integer          not null
#  period        :integer          not null
#  grade         :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Timetable < ActiveRecord::Base

  belongs_to :lecture
  belongs_to :department
  belongs_to :course

  validates :lecture_id, presence: true
  validates :department_id, presence: true
  validates :year, presence: true
  validates :term, presence: true
  validates :wday, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 7 }
  validates :period, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :grade, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
