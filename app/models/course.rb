class Course < ActiveRecord::Base
  has_many :hours
  has_many :teaching_assistants, through: :hours

  # scope for students (negative hours)
  # scope for TAs (positive hours)
end
