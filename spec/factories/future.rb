require 'faker'

FactoryGirl.define do
  factory :series do
    name      Faker::Commerce.color.capitalize
    end_date  40.days.from_now

    # series with courses
    factory :series_with_courses do
      ignore do
        courses_count 4
      end

      after(:create) do |series, evaluator|
        create_list(:course, evaluator.courses_count, series: series)
      end
    end
  end

  factory :course do
    name            Faker::Commerce.department
    url             Faker::Internet.url
    location        'A Place in Chicago'
    credit_hours    2
    num_tas_needed  4
    meetup_id       '12345'
    start_time      2.hours.from_now
    end_time        6.hours.from_now
    sequence(:date, 10) { |n| n.days.from_now }

    # course with 5 hours
    # hour with teaching assistant
    factory :course_with_hours do
      ignore do
        hours_count 5
      end

      after(:create) do |course, evaluator|
        create_list(:hour, evaluator.hours_count, course: course)
      end
    end
  end
end