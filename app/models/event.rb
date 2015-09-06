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


  def find_project
    if self.resource_object_type == "Todo"
      self.resource_object.todolist.project

    elsif self.resource_object_type == 'Todolist'
      self.resource_object.project

    elsif self.resource_object_type == 'Team'
      self.resource_object

    elsif self.resource_object_type == 'Project'
      self.resource_object
    end
  end
end
