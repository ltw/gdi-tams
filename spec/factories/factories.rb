FactoryGirl.define do
  factory :course do
    name            'Course'
    date            Date.today
    url             'http://google.com'
    location        'A Place in Chicago'
    credit_hours    2
    num_tas_needed  4
    meetup_id       '12345'
    start_time      2.hours.from_now
    end_time        6.hours.from_now
  end

  # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   first_name "Admin"
  #   last_name  "User"
  #   admin      true
  # end
end

# Returns a User instance that's not saved
# user = build(:user)

# Returns a saved User instance
# user = create(:user)

# It's possible to set up associations within factories. If the factory name is the same as the association name, the factory name can be left out.

# factory :post do
#   # ...
#   author
# end


# Generating data for a has_many relationship is a bit more involved, depending on the amount of flexibility desired, but here's a surefire example of generating associated data.

# FactoryGirl.define do

#   # post factory with a `belongs_to` association for the user
#   factory :post do
#     title "Through the Looking Glass"
#     user
#   end

#   # user factory without associated posts
#   factory :user do
#     name "John Doe"

#     # user_with_posts will create post data after the user has been created
#     factory :user_with_posts do
#       # posts_count is declared as a transient attribute and available in
#       # attributes on the factory, as well as the callback via the evaluator
#       transient do
#         posts_count 5
#       end

#       # the after(:create) yields two values; the user instance itself and the
#       # evaluator, which stores all values from the factory, including transient
#       # attributes; `create_list`'s second argument is the number of records
#       # to create and we make sure the user is associated properly to the post
#       after(:create) do |user, evaluator|
#         create_list(:post, evaluator.posts_count, user: user)
#       end
#     end
#   end
# end


# Traits allow you to group attributes together and then apply them to any factory.

# factory :user, aliases: [:author]

# factory :story do
#   title "My awesome story"
#   author

#   trait :published do
#     published true
#   end

#   trait :unpublished do
#     published false
#   end

#   trait :week_long_publishing do
#     start_at { 1.week.ago }
#     end_at   { Time.now }
#   end

#   trait :month_long_publishing do
#     start_at { 1.month.ago }
#     end_at   { Time.now }
#   end

#   factory :week_long_published_story,    traits: [:published, :week_long_publishing]
#   factory :month_long_published_story,   traits: [:published, :month_long_publishing]
#   factory :week_long_unpublished_story,  traits: [:unpublished, :week_long_publishing]
#   factory :month_long_unpublished_story, traits: [:unpublished, :month_long_publishing]
# end