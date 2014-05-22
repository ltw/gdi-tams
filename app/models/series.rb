class Series < ActiveRecord::Base
  has_many :courses

  scope :upcoming, lambda { where("end_date > ?", Date.today) }
end
