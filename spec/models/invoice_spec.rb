require 'rails_helper'

FactoryGirl.define do 
  factory :contact do
    vendor_name { Faker::Company.name }
  end
  
  factory :invalid_contact do 
    vendor_name nil
  end
end

