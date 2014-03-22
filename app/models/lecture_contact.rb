# == Schema Information
#
# Table name: lecture_contacts
#
#  id         :integer          not null, primary key
#  lecture_id :integer          not null
#  contact_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class LectureContact < ActiveRecord::Base

  belongs_to :lecture
  belongs_to :contact

  validates :lecture_id, presence: true
  validates :contact_id, presence: true, uniqueness: { scope: :lecture_id }
end
