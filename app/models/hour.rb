class Hour < ActiveRecord::Base
  belongs_to :teaching_assistant
  belongs_to :course
end
