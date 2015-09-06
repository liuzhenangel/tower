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

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
