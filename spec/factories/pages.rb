# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    name 'MyString'
    content 'MyText'
    locale 'MyString'
    tag 'MyString'
  end
end
