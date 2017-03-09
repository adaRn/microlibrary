FactoryGirl.define do
  factory :user do
    name 'John Doe'
    provider 'google_oauth2'
    uid (:A..:Z).to_a.sample(20).join # This generates random uid
  end
end
