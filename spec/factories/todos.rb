# == Schema Information
#
# Table name: todos
#
#  id          :integer          not null, primary key
#  name        :string
#  user_id     :integer
#  end_time    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  todolist_id :integer
#  aasm_state  :string
#  deleted_at  :datetime
#

FactoryGirl.define do
  factory :todo do
    name "MyString"
user_id 1
end_time "2015-09-01 12:47:33"
  end

end
