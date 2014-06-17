# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :line_item do
    association :product, factory: :ruby
    order
  end

  factory :line_item_two do
    association :product, factory: :ruby
    cart
  end
end
