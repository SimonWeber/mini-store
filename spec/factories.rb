FactoryGirl.define do
  factory :offer do
    name "Paceña"
    description "Una cervezita bien fria"
    created_at { DateTime.now }
    quantity 100
    cost 10
  end

  factory :order do
    received_at { DateTime.now }
    quantity 1
    firstname "Mister"
    lastname "Pancho"
    telephone "051111"
    email "mr.pancho@example.com"
    street "Panchostreet 1"
    zip "30625"
    city "Panchocity"
    association :offer
  end

  factory :user do
    email "chochito@example.com"
    password "password"
  end
end
