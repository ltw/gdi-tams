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
    describe 'past' do
      before do
        @course = create(:course_past_with_hours)
        @ta = @course.teaching_assistants.first
      end

      it '#balance' do
        expect(@ta.balance).to eq(2)
      end

      it '#pending_balance' do
        expect(@ta.pending_balance).to eq(2)
      end

      it '#history' do
        expect(@ta.history.length).to eq(1)
      end
    end

    describe 'future' do
      before do
        @course = create(:course_with_hours)
        @ta = @course.teaching_assistants.first
      end

      it '#pending_balance' do
        expect(@ta.pending_balance).to eq(2)
      end

      it '#balance' do
        expect(@ta.balance).to eq(0)
      end

      it '#schedule' do
        expect(@ta.schedule.length).to eq(1)
      end
    end

    describe 'status checks' do
      before do
        @ta = create(:teaching_assistant)
      end

      it '#pending?' do
        expect(@ta.pending?).to be_false
      end

      it '#approved?' do
        expect(@ta.approved?).to be_true
      end

      it '#inactive?' do
        expect(@ta.inactive?).to be_false
      end
    end
  end

  context 'methods with args' do
    before do
      @course = create(:course_with_hours)
      @ta = @course.teaching_assistants.first
    end

    describe '#signed_up_for(course)' do
      it 'requires an argument' do
        expect { @ta.signed_up_for }.to raise_error(ArgumentError)
      end

      it 'returns a string' do
        expect(@ta.signed_up_for(@course)).to be_instance_of(String)
      end

      it 'returns TA for TAs' do
        expect(@ta.signed_up_for(@course)).to eq('TA')
      end

      it 'returns Student for students' do
        hour = create(:hour_debit)
        ta = hour.teaching_assistant
        expect(ta.signed_up_for(hour.course)).to eq('Student')
      end

      it 'returns no if not attending' do
        ta = create(:teaching_assistant)
        expect(ta.signed_up_for(@course)).to eq(nil)
      end
    end

    describe '#is_ta_for?(course)' do
      it 'requires an argument' do
        expect { @ta.is_ta_for? }.to raise_error(ArgumentError)
      end

      it 'returns a boolean' do
        expect(@ta.is_ta_for?(@course)).to be_instance_of(TrueClass)
      end

      it 'returns true for TAs' do
        expect(@ta.is_ta_for?(@course)).to be_true
      end
    end

    describe '#is_student_in?(course)' do
      it 'requires an argument' do
        expect { @ta.is_student_in? }.to raise_error(ArgumentError)
      end

      it 'returns a boolean' do
        expect(@ta.is_student_in?(@course)).to be_instance_of(FalseClass)
      end

      it 'returns false for TAs' do
        expect(@ta.is_student_in?(@course)).to be_false
      end
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
