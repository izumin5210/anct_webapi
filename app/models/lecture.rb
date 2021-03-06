# == Schema Information
#
# Table name: lectures
#
#  id                 :integer          not null, primary key
#  title              :string(255)      not null
#  required_selective :string(255)      not null
#  divide             :string(255)      not null
#  term               :string(255)      not null
#  credit             :integer          not null
#  category           :string(255)
#  abstract           :text
#  failure_absence    :text
#  evaluation         :text
#  textbooks          :text
#  created_at         :datetime
#  updated_at         :datetime
#  grade              :integer          not null
#  department_id      :integer          not null
#  course_id          :integer
#

class Lecture < ActiveRecord::Base

  belongs_to :department
  belongs_to :course
  has_many :timetables
  has_many :lecture_contacts
  has_many :contacts, through: :lecture_contacts
  has_many :lecture_lecturers
  has_many :lecturers, through: :lecture_lecturers
  has_many :plans

  validates :title, presence: true
  validates :required_selective, presence: true
  validates :divide, presence: true
  validates :term, presence: true
  validates :credit, presence: true
  validates :department_id, presence: true
  validates :grade, presence: true, numericality: { only_integer: true, greater_than: 0 }

  extend Enumerize
  enumerize :required_selective, in: Settings.lecture.required_selective
  enumerize :divide, in: Settings.lecture.divide
  enumerize :term, in: Settings.lecture.term
end
