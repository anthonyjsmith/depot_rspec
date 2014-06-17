# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    name "Dave Thomas"
    address "MyText"
    email "dave@example.com"
    pay_type "Check"
  end
end
