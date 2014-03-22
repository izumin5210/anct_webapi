class Contact < ActiveRecord::Base

  has_many :lecture_contacts
  has_many :lectures, through: :lecture_contacts

  validates :email, presence: true
end
