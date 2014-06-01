require 'faker'

FactoryGirl.define do

  factory :course_beyond_last_month, class: Course do
    name            Faker::Commerce.department
    url             Faker::Internet.url
    location        'A Place in Chicago'
    credit_hours    2
    num_tas_needed  4
    meetup_id       '12345'
    start_time      2.hours.from_now
    end_time        6.hours.from_now
    date            3.months.ago
  end

  factory :series_beyond_last_month, class: Series do
    name      Faker::Commerce.color.capitalize
    end_date  3.months.ago
  end

  factory :series_past, class: Series do
    name      Faker::Commerce.color.capitalize
    end_date  9.days.ago

    # series with courses
    factory :series_past_with_courses do
      ignore do
        courses_count 4
      end

      after(:create) do |series, evaluator|
        create_list(:course_past, evaluator.courses_count, series: series)
      end
    end
  end

  factory :course_past, class: Course do
    name            Faker::Commerce.department
    url             Faker::Internet.url
    location        'A Place in Chicago'
    credit_hours    2
    num_tas_needed  4
    meetup_id       '12345'
    start_time      2.hours.from_now
    end_time        6.hours.from_now
    sequence(:date, 10) { |n| n.days.ago }

    # course with 5 hours
    # hour with teaching assistant
    factory :course_past_with_hours do
      ignore do
        hours_count 5
      end

      after(:create) do |course, evaluator|
        create_list(:hour, evaluator.hours_count, course: course)
      end
    end
  end
end