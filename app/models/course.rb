class Course < ActiveRecord::Base
  has_many :sessions
  has_many :hours
  has_many :teaching_assistants, through: :hours

  scope :upcoming, lambda { where("date > ?", Date.today) }

  def hour_for(teaching_assistant)
    hours.where(teaching_assistant: teaching_assistant).first
  end

  def credits_array
    a=*(1..credit_hours)
  end
end
