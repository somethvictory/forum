# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: User do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }

    sequence(:email) do |n|
      "#{n}-#{FFaker::Internet.email}"
    end
  end
end
