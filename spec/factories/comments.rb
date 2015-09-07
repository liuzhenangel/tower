# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  todo_id    :integer
#  user_id    :integer
#

FactoryGirl.define do
  factory :comment do
    content "MyText"
  end
end
