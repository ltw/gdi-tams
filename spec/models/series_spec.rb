require 'spec_helper'

describe Series do
  context 'validations' do
    it 'requires name' do
      series = Series.new(end_date: 5.weeks.from_now)
      expect { series.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'requires end_date' do
      series = Series.new(name: 'Hello')
      expect { series.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'course relationships' do
    before do
      @series = create(:series_with_courses)
    end

    it 'has_many' do
      expect(@series.courses.length).to be > 1
    end

    it 'destroys dependent courses' do
      course = @series.courses.first
      @series.destroy
      expect { course.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  context 'class methods' do
    before do
      create_list(:series_with_courses, 5)
      create_list(:series_past_with_courses, 10)
    end

    it '#upcoming' do
      expect(Series.upcoming.length).to eq(5)
    end

    it '#last_month' do
      Series.create!(end_date: 2.months.ago, name: 'Old Course')
      expect(Series.last_month.length).to eq(10)
    end
  end

  context 'methods' do
    it '#pretty_end_date' do
      series = create(:series)
      expect(series.pretty_end_date).to be_instance_of(String)
    end
  end
end