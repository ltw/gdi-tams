class Status < ActiveRecord::Base
  has_many :teaching_assistants

  validates_presence_of :label
end
