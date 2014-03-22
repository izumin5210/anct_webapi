class LectureContact < ActiveRecord::Base

  belongs_to :lecture
  belongs_to :contact

  validates :lecture_id, presence: true
  validates :contact_id, presence: true
end
