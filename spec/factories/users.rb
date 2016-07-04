FactoryGirl.define do
  factory :user do
    sequence :first_name do |n|
      "User #{n} FN"
    end
    sequence :last_name do |n|
      "User #{n} LN"
    end
    sequence :username do |n|
      "user#{n}"
    end
    sequence :email do |n|
      "user#{n}@example.com"
    end
  end
end
