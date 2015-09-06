# == Schema Information
#
# Table name: role_resources
#
#  id            :integer          not null, primary key
#  access_id     :integer
#  resource_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :role_resource do
    access_id 1
resource_name "MyString"
  end

end
