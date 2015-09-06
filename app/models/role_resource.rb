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

class RoleResource < ActiveRecord::Base
  validates_uniqueness_of :resource_name, scope: :access_id
  belongs_to :access

  def to_cancan
  end
end
