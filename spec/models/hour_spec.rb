require 'spec_helper'

describe Hour do
  before do
    @course = create(:course_with_hours)
    @hours = @course.hours
  end

  context 'relationships' do
    it 'belongs_to teaching_assistant'
    it 'belongs_to course'
  end

  context 'validations' do
    it 'requires num'
    it 'requires teaching_assistant'
    it 'requires course'
  end

  context 'class methods' do
    it '#credit'
    it '#debit'
  end

  context 'methods' do
    it '#is_credit?'
    it '#is_debit?'
  end
end