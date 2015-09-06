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

require 'rails_helper'

RSpec.describe RoleResource, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
