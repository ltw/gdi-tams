class Course < ActiveRecord::Base
  belongs_to :series
  has_many :hours
  has_many :teaching_assistants, through: :hours

  scope :upcoming, -> { where("date > ?", Date.today) }
  scope :single_day, -> { where("series_id IS NULL") }
  scope :series, -> { where("series_id > ?", 0) }

  def hour_for(teaching_assistant)
    hours.where(teaching_assistant: teaching_assistant).first
  end

  def credits_array
    a=*(1..credit_hours)
  end

  def is_series?
    series.id.present?
  end
end
