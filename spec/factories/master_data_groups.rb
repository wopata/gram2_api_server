FactoryGirl.define do
  factory :master_data_group, class: 'MasterData::Group' do
    uuid {SecureRandom.uuid}
    name {Faker::Team.creature}
    short_name {Faker::Team.creature.downcase}
    description {Faker::Company.catch_phrase}
  end
end
