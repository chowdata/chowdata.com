require 'faker'

FactoryGirl.define do

  factory :profile  do |f|
    f.inbound_email  { Faker::Internet.user_name }
  end

  factory :invalid_profile, parent: :profile do |f|
  end

end
