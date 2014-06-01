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

  # context 'class methods' do
    # 'FactoryGirl is giving me shit about these'
    # before do
    #   create_list(:teaching_assistant, 10)
    #   create_list(:teaching_assistant_pending, 5)
    #   create_list(:teaching_assistant_banned, 5)
    #   create_list(:teaching_assistant_prospective, 5)
    #   create_list(:teaching_assistant_inactive, 5)
    # end

    # it '#approved' do
    #   TeachingAssistant
    #   debugger
    #   expect(TeachingAssistant.approved.length).to eq(10)
    # end

    # it '#pending' do
    #   expect(TeachingAssistant.pending.length).to eq(5)
    # end

    # it '#banned' do
    #   expect(TeachingAssistant.banned.length).to eq(5)
    # end

    # it '#prospective' do
    #   expect(TeachingAssistant.prospective.length).to eq(5)
    # end

    # it '#active' do
    #   expect(TeachingAssistant.active.length).to eq(15)
    # end
  # end
end
