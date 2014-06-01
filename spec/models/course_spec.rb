require 'spec_helper'

# course = Course.new({
#         name: 'Course',
#         date: Date.today,
#         url: 'http://google.com',
#         location: 'A Place in Chicago',
#         num_tas_still_needed: 4,
#         meetup_id: '12345',
#         credit_hours: 2,
#         start_time: 2.hours.from_now,
#         end_time: 6.hours.from_now
#         })

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
    it 'belongs_to series'

    describe 'hours with dependent destroy' do
       it 'has_many'
       it 'destroys hours'
    end

    it 'has_many teaching_assistants'
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