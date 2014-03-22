# == Schema Information
#
# Table name: lecture_lecturers
#
#  id          :integer          not null, primary key
#  lecture_id  :integer          not null
#  lecturer_id :integer          not null
#  created_at  :datetime
#  updated_at  :datetime
#

class LectureLecturer < ActiveRecord::Base

  belongs_to :lecture
  belongs_to :lecturer

  validates :lecture_id, presence: true
  validates :lecturer_id, presence: true, uniqueness: { scope: :lecture_id }
end
