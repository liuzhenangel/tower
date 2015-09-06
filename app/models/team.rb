# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  has_many :events, dependent: :destroy
  has_and_belongs_to_many :users
  after_create :after_create_team_create_event

  private
  def create_event(action)
    Event.create(user: User.current,
                 action: action,
                 team: self,
                 resource_object: self)
  end

  def after_create_team_create_event
    create_event('创建了团队')
  end
end
