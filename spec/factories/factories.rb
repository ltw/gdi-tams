require 'faker'

FactoryGirl.define do
  # unique emails
  sequence :email do |n|
    Faker::Internet.email(Faker::Name.name + n.to_s)
  end

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

  factory :teaching_assistant do
    name      Faker::Name.first_name + Faker::Name.last_name
    email
    status
  end

  factory :teaching_assistant_pending, class: TeachingAssistant do
    name      Faker::Name.first_name + Faker::Name.last_name
    email
    status_pending
  end

  factory :teaching_assistant_banned, class: TeachingAssistant do
    name      Faker::Name.first_name + Faker::Name.last_name
    email
    status_banned
  end

  factory :teaching_assistant_prospective, class: TeachingAssistant do
    name      Faker::Name.first_name + Faker::Name.last_name
    email
    status_prospective
  end

  factory :status_pending, class: Status do
    label 'pending'
  end

  factory :status_banned, class: Status do
    label 'banned'
  end

  factory :status_prospective, class: Status do
    label 'prospective'
  end

  factory :status do
    label   'approved'

    factory :status_with_tas do
      ignore do
        tas_count 10
      end

      after(:create) do |status, evaluator|
        create_list(:teaching_assistant, evaluator.tas_count, status: status)
      end
    end
  end
end
