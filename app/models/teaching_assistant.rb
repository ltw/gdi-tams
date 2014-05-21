class TeachingAssistant < ActiveRecord::Base
  belongs_to :status
  has_many :courses
end
