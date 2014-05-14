FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.words.join(' ') }
    body { Faker::Lorem.paragraph(2) }
    date { Kernel.rand(2.years).seconds.ago }
  end
end
