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

require 'anct'

class Timetable < ActiveRecord::Base

  belongs_to :lecture
  belongs_to :location

  validates :year, presence: true
  validates :term, presence: true
  validates :wday, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 7 }
  validates :period, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # TODO: 未テスト
  scope :department, -> (department_id) {
    includes(:lecture).where(Lecture.arel_table[:department_id].eq(department_id)).references(:lecture)
  }
  # TODO: 未テスト
  scope :course, -> (course_id) {
    includes(:lecture).where(Lecture.arel_table[:course_id].eq(course_id)).references(:lecture)
  }
  # TODO: 未テスト
  scope :grade, -> (grade) {
    includes(:lecture).where(Lecture.arel_table[:grade].eq(grade)).references(:lecture)
  }
  # TODO: 未テスト
  scope :now, -> { where(year: Anct.fiscal_year, term: Anct.term) }
end
