# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  project_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  team_id      :integer
#

FactoryGirl.define do
  factory :project do
    name "MyString"
    description "MyText"
    project_type "standard"
  end
end
