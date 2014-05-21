class Hour < ActiveRecord::Base
  belongs_to :teaching_assistant
  belongs_to :course

  scope :credit, -> { where(:num < 0) }
  scope :debit, -> { where(:num > 1) }
end
