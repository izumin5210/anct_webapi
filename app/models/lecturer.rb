# == Schema Information
#
# Table name: lecturers
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Lecturer < ActiveRecord::Base

  has_many :lecture_lecturers
  has_many :lectures, through: :lecture_lecturers

  validates :name, presence: true, uniqueness: true
end
