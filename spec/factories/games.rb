# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    match_id 1
    game_number 1
    a_score 1
    b_score 1
  end
end
