class TeachingAssistant < ActiveRecord::Base
  before_save :generate_private_id

  belongs_to :status
  has_many :hours
  has_many :courses, through: :hours

  validates_uniqueness_of :private_id

  scope :approved, -> { where status: Status.find_by_label("approved") }
  scope :pending, -> { where status: Status.find_by_label("pending") }
  scope :banned, -> { where status: Status.find_by_label("banned") }

  def balance
    hours.to_a.map(&:num).inject(&:+)
  end

  def generate_private_id
    self.private_id = SecureRandom.hex
  end
end
