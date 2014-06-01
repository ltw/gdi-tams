require 'spec_helper'

describe TeachingAssistant do
  context 'before_create' do
    before do
      @ta = build(:teaching_assistant)
    end

    it 'does not have a private_id' do
      expect(@ta.private_id).to be_nil
    end

    it '#generate_private_id' do
      @ta.save!
      expect(@ta.private_id).to be_true
    end
  end

  context 'relationships' do
    it 'belongs_to status' do
      ta = create(:teaching_assistant)
      expect(ta.status_id).to be_true
    end

    describe 'hours with dependent destroy' do
      before do
        courses = create_list(:course_with_hours, 2)
        @ta = courses.first.teaching_assistants.first
      end

      it 'has_many courses' do
        expect(@ta.courses).to be_true
      end

      it 'has_many hours' do
        expect(@ta.hours).to be_true
      end

      it 'destroys hours' do
        hour = @ta.hours.first
        @ta.destroy
        expect { hour.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  context 'class methods' do
    it '#approved'
    it '#pending'
    it '#banned'
    it '#prospective'
    it '#active' # on a different branch
  end

  context 'methods' do
    it '#pending_balance'
    it '#balance'
    it '#history'
    it '#schedule'

    describe 'status checks' do
      # All on a different branch
      it '#pending?'
      it '#approved?'
      it '#inactive?'
    end

    describe '#signed_up_for(course)' do
      it 'requires an argument'
      it 'expects a course'
      it 'returns a string'
      it 'returns TA for TAs'
      it 'returns Student for students'
      it 'returns no if not attending'
    end

    describe '#is_ta_for?(course)' do
      it 'requires an argument'
      it 'expects a course'
      it 'returns a boolean'
      it 'returns true for TAs'
      it 'returns false for students and nos'
    end

    describe '#is_student_in?(course)' do
      it 'requires an argument'
      it 'expects a course'
      it 'returns a boolean'
      it 'returns true for students'
      it 'returns false for TAs and nos'
    end
  end
end