class TeachingAssistant < ActiveRecord::Base
  belongs_to :status
  has_many :hours
  has_many :courses, through: :hours

  scope :approved, -> { where status: Status.find_by_label("approved") }
  scope :pending, -> { where status: Status.find_by_label("pending") }
  scope :banned, -> { where status: Status.find_by_label("banned") }
end
