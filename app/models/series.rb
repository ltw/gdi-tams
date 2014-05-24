class Series < ActiveRecord::Base
  has_many :courses, dependent: :destroy

  scope :upcoming, lambda { where("end_date > ?", Date.today) }
end
