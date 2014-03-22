# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  email      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base

  has_many :lecture_contacts
  has_many :lectures, through: :lecture_contacts

  validates :email, presence: true
end
