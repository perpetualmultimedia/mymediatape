# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Define ORM. Could be :active_record (default) and :mongoid
  # config.orm = :active_record

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grand badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
Merit::Badge.create!(
  id: 1,
  name: "In A Van Down By The River Artist",
  description: "Over 25 Band Votes"
)
Merit::Badge.create!(
  id: 2,
  name: "Coming To America Artist",
  description: "Over 100 Band Votes"
)
Merit::Badge.create!(
  id: 3,
  name: "Local Aficionado Artist",
  description: "Over 500 Band Votes"
)
Merit::Badge.create!(
  id: 4,
  name: "Too Legit To Quit Artist",
  description: "Over 1000 Band Votes"
)
Merit::Badge.create!(
  id: 5,
  name: "Bronze Kneecap",
  description: "Over 10 Album Votes"
)
Merit::Badge.create!(
  id: 6,
  name: "Silver Surfer",
  description: "Over 30 Album Votes"
)
Merit::Badge.create!(
  id: 7,
  name: "Gold Finger",
  description: "Over 50 Album Votes"
)
Merit::Badge.create!(
  id: 8,
  name: "I'm Goin Platinum",
  description: "Over 100 Album Votes"
)
Merit::Badge.create!(
  id: 9,
  name: "Diamonds On My Kneck",
  description: "Over 250 Album Votes"
)
Merit::Badge.create!(
  id: 10,
  name: "Elevator Music",
  description: "Over 25 Songs Votes"
)
Merit::Badge.create!(
  id: 11,
  name: "Cruisin' Tune",
  description: "Over 50 Song Votes"
)
Merit::Badge.create!(
  id: 12,
  name: "Tha Jam",
  description: "Over 100 Album Votes"
)
Merit::Badge.create!(
  id: 13,
  name: "Radio Single",
  description: "Over 500 Album Votes"
)
Merit::Badge.create!(
  id: 14,
  name: "Club Banger",
  description: "Over 1000 Album Votes"
)
Merit::Badge.create!(
  id: 15,
  name: "Subway Maniac",
  description: "Over 20 Followers"
)
Merit::Badge.create!(
  id: 16,
  name: "Street Performer",
  description: "Over 50 Followers"
)
Merit::Badge.create!(
  id: 17,
  name: "Street King",
  description: "Over 100 Followers"
)
Merit::Badge.create!(
  id: 18,
  name: "Political Pariah",
  description: "Over 500 Followers"
)
Merit::Badge.create!(
  id: 19,
  name: "Your Mom Follows Me",
  description: "Over 1000 Followers"
)
Merit::Badge.create!(
  id: 20,
  name: "Local Messiah",
  description: "Over 5000 Followers"
)
