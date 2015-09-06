# == Schema Information
#
# Table name: events
#
#  id                   :integer          not null, primary key
#  resource_object_id   :integer
#  resource_object_type :string
#  action               :string
#  user_id              :integer
#  content              :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  team_id              :integer
#

FactoryGirl.define do
  factory :event do
    resource_object_id 1
resource_object_type "MyString"
action "MyString"
user_id 1
content "MyText"
  end

end
