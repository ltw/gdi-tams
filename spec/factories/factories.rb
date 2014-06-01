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

  factory :status do
    label   'approved'
  end
end
