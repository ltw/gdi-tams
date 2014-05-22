class Course < ActiveRecord::Base
  has_many :hours
  has_many :teaching_assistants, through: :hours

  scope :upcoming, lambda { where("date > ?", Date.today) }

  def hour_for(teaching_assistant)
    @hour = hours.where(teaching_assistant: teaching_assistant).first
  end
end
