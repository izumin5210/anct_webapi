# == Schema Information
#
# Table name: plans
#
#  id         :integer          not null, primary key
#  lecture_id :integer          not null
#  number     :integer          not null
#  title      :string(255)
#  detail     :text
#  created_at :datetime
#  updated_at :datetime
#

class Plan < ActiveRecord::Base

  belongs_to :lecture

  validates :lecture_id, presence: true
  validates :number, presence: true
end
