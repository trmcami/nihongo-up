FactoryGirl.define do
  sequence :external_id

  factory :title do
    name { Faker::Lorem.sentence(3) }
    external_id { Faker::Number.number(5) }
    summary { Faker::Lorem.paragraph(2) }
    last_sync { 1.day.ago }
    title_type
  end

  factory :title_type do
    name { Faker::Lorem.word }
  end
end
