class TeachingAssistant < ActiveRecord::Base
  before_create :generate_private_id

  belongs_to :status
  has_many :hours, dependent: :destroy
  has_many :courses, through: :hours

  validates_uniqueness_of :private_id, :email
  validates_presence_of :name, :email, :status


  # STATUSES
  scope :approved, -> { where status: Status.find_by_label("approved") }
  scope :pending, -> { where status: Status.find_by_label("pending") }
  scope :banned, -> { where status: Status.find_by_label("banned") }
  scope :prospective, -> { where status: Status.find_by_label("prospective") }

  def self.active
    self.where.not(status: [Status.find_by_label("inactive"), Status.find_by_label("banned"), Status.find_by_label("prospective")])
  end

  def pending?
    status.label == "pending"
  end

  def approved?
    status.label == "approved"
  end

  def inactive?
    (status.label == "inactive") || (status.label == "banned")
  end

  def prospective?
    status.label == "prospective"
  end

  # BALANCES
  def pending_balance
    hours.to_a.map(&:num).inject(&:+)
  end

  def balance
    history.to_a.map(&:num).inject(&:+)
  end


  # SCHEDULING & ATTENDANCE
  def history
    hours.select { |h| h.course.date < Date.today }.sort_by { |h| h.course.date }
  end

  def schedule
    hours.where('num > 0').select { |h| h.course.date > Date.today }.map(&:course).sort_by(&:date)
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

  def is_ta_for?(course)
    hours.credit.where(course: course).present?
  end

  def is_student_in?(course)
    hours.debit.where(course: course).present?
  end

  private
  def generate_private_id
    self.private_id = SecureRandom.hex
  end
end
