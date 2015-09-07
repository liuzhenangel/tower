# == Schema Information
#
# Table name: accesses
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  resource_type :string
#  resource_id   :integer
#  project_id    :integer
#

require 'rails_helper'

RSpec.describe Access, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
