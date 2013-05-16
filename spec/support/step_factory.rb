FactoryGirl.define do
  factory :step do
    sequence(:number) { |n| n }
    summary "example summary"
    description "blah blah blah"
  end
end
