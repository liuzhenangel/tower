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

class Event < ActiveRecord::Base
  belongs_to :team
  belongs_to :user
  belongs_to :resource_object, polymorphic: true

  default_scope {order("id desc")}
end
