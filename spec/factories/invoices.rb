require  'faker'

FactoryGirl.define do 
  factory :invoice do |f| 
    f.vendor_name  { Faker::Company.name }
    f.association  :location, factory: :location
  end 

  factory :invalid_invoice, parent: :invoice do |f|
    f.vendor_name nil
  end
end 
