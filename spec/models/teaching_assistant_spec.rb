require 'spec_helper'

describe TeachingAssistant do
  context 'before_create' do
    it '#generate_private_id'
  end

  context 'relationships' do
    it 'belongs_to status'
    it 'has_many courses'

    describe 'hours with dependent destroy' do
      it 'has_any'
      it 'destroys hours'
    end
  end

  context 'validations' do
    it 'requires uniqueness for private_id'
    it 'requires uniqueness for email'
    it 'requires name'
    it 'requires email'
    it 'requires status'
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