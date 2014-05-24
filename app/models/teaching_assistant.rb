class TeachingAssistant < ActiveRecord::Base
  before_save :generate_private_id

  belongs_to :status
  has_many :hours, dependent: :destroy
  has_many :courses, through: :hours, dependent: :destroy

  validates_uniqueness_of :private_id, :email
  validates_presence_of :name, :email

  scope :approved, -> { where status: Status.find_by_label("approved") }
  scope :pending, -> { where status: Status.find_by_label("pending") }
  scope :banned, -> { where status: Status.find_by_label("banned") }
  scope :prospective, -> { where status: Status.find_by_label("prospective") }

  def balance
    hours.to_a.map(&:num).inject(&:+)
  end

  def history
    hours.select { |hour| hour.course.date > Date.today }
  end

  def pending?
    status.label == "pending"
  end

  def approved?
    status.label == "approved"
  end

  def signed_up_for(course)
    if is_ta_for?(course)
      "TA"
    elsif is_student_in?(course)
      "Student"
    else
      "No"
    end
  end

  protected
  def is_ta_for?(course)
    hours.credit.where(course: course).present?
  end

  def is_student_in?(course)
    hours.debit.where(course: course).present?
  end

  def generate_private_id
    self.private_id = SecureRandom.hex
  end
end
