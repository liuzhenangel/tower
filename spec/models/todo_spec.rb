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

require 'rails_helper'

RSpec.describe Todo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
