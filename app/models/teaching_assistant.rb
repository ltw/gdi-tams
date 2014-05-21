class TeachingAssistant < ActiveRecord::Base
  belongs_to :status
  has_many :courses

  scope :approved, -> { where status: Status.find_by_label("approved") }
  scope :pending, -> { where status: Status.find_by_label("pending") }
  scope :banned, -> { where status: Status.find_by_label("banned") }
end
