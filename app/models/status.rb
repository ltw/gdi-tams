class Status < ActiveRecord::Base
  has_many :teaching_assistants
end
