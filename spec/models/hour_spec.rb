require 'spec_helper'

describe Hour do
  before do
    @course = create(:course_with_hours)
    @hour = @course.hours.first
  end

  context 'relationships' do
    it 'belongs_to teaching_assistant' do
      expect(@hour.teaching_assistant).to be_instance_of(TeachingAssistant)
    end

    it 'belongs_to course' do
      expect(@hour.course).to be_instance_of(Course)
    end
  end

  context 'validations' do
    it 'requires num' do
      hour = Hour.new(teaching_assistant: create(:teaching_assistant), course: create(:course))
      expect { hour.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'requires teaching_assistant' do
      hour = Hour.new(num: 1, course: create(:course))
      expect { hour.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'requires course' do
      hour = Hour.new(teaching_assistant: create(:teaching_assistant), num: 1)
      expect { hour.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'class methods' do
    before do
      create_list(:hour_debit, 5)
    end

    it '#credit' do
      expect(Hour.credit.length).to eq(5)
    end

    it '#debit' do
      expect(Hour.debit.length).to eq(5)
    end
  end

  context 'methods' do
    it '#is_credit?' do
      hour = create(:hour)
      expect(hour.is_credit?).to be_true
    end

    it '#is_debit?' do
      hour = create(:hour_debit)
      expect(hour.is_debit?).to be_true
    end
  end
end