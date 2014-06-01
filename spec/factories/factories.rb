require 'faker'

FactoryGirl.define do
  # unique emails
  sequence :email do |n|
    Faker::Internet.email(Faker::Name.name + n.to_s)
  end

  # hour with teaching_assistant association
  # created before_validations to pass requirement
  factory :hour do
    num 2
    course

    after(:build) do |hour|
      hour.teaching_assistant = create(:teaching_assistant)
    end
  end

  factory :hour_debit, class: Hour do
    num  -2
    course

    after(:build) do |hour|
      hour.teaching_assistant = create(:teaching_assistant)
    end
  end

  # course
  # created in the future
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
  end

  # series
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

  # series in the past
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

  factory :teaching_assistant do
    name      Faker::Name.first_name + Faker::Name.last_name
    email
    status
  end

  factory :status do
    label   'approved'
  end

  # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end
