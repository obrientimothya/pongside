# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :match do
    a_first_name "MyString"
    a_last_name "MyString"
    a_country "MyString"
    b_first_name "MyString"
    b_last_name "MyString"
    b_country "MyString"
    is_running false
    is_over false
    table_id 1
    started_at "2014-04-07 22:56:22"
    finished_at "2014-04-07 22:56:22"
    a_red_card false
    a_yellow_card false
    a_timeout false
    b_red_card false
    b_yellow_card false
    b_timeout false
  end
end
