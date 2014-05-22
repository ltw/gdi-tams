class Course < ActiveRecord::Base
  has_many :hours
  has_many :teaching_assistants, through: :hours

  scope :upcoming, lambda { where("date > ?", Date.today) }
end
