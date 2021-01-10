# spec/factories/todos.rb
FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.word }
    post_id nil
  end
end