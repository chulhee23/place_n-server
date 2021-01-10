
FactoryBot.define do
  factory :post do
    content { Faker::Lorem.word }
  end
end