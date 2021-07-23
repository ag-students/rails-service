FactoryBot.define do
  factory :profile

  factory :user do
    email { "123qwe@gmail.com" }
    password { "111111111" }

    with_profile

    trait :with_profile do
      profile
    end
  end
end
