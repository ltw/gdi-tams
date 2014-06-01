require 'spec_helper'

describe Course do
  context 'before_validation#format_pretty_dates' do
    before do
      @course = build(:course)
    end

    it 'passes validations' do
      expect(@course.save!).to be_true
    end

    it 'formats pretty_date' do
      @course.save!
      pretty_date = @course.date.strftime("%B %e, %Y (%A)")
      expect(pretty_date).to eq(@course.pretty_date)
    end

    it 'formats pretty_time' do
      @course.save!
      pretty_time = "#{@course.start_time.strftime("%I:%M %p")}–#{@course.end_time.strftime("%I:%M %p")}"
      expect(pretty_time).to eq(@course.pretty_time)
    end
  end

  context 'relationships' do
    it 'belongs_to series' do
      @series = create(:series_with_courses)
      expect(@series.courses.first.series).to eq(@series)
    end

    describe 'hours with dependent destroy' do
      before do
        @course = create(:course_with_hours)
      end

       it 'has_many' do
        expect(@course.hours.length).to eq(5)
       end

       it 'destroys hours' do
        hour = @course.hours.first
        @course.destroy
        expect { hour.reload }.to raise_error(ActiveRecord::RecordNotFound)
       end
    end

    it 'has_many teaching_assistants' do
      @course = create(:course_with_hours)
      expect(@course.teaching_assistants.count).to eq(5)
    end
  end

  context 'class methods' do
    it '#upcoming'
    it '#single_day'
    it '#series'
    it '#last_month'
  end

  context 'methods' do
    it '#is_series?'
    it '#need_tas?'
    it '#num_tas_still_needed'
  end
end