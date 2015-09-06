# == Schema Information
#
# Table name: todolists
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer
#

FactoryGirl.define do
  factory :todolist do
    name "MyString"
description "MyString"
  end

end
