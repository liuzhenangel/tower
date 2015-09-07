# == Schema Information
#
# Table name: projects
#
#  id           :integer          not null, primary key
#  name         :string
#  description  :text
#  project_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  team_id      :integer
#

class Project < ActiveRecord::Base
  belongs_to :team
  has_many :accesses
  has_many :todolists, dependent: :destroy
  has_and_belongs_to_many :users
  after_create :create_default_todolist
  after_create :after_create_project_create_event

  extend Enumerize

  enumerize :project_type, in: [:standard, :agility]

  private
  def create_default_todolist
    self.todolists.find_or_create_by!(name: '')
  end

  def create_event(action)
    Event.create(user: User.current,
                 action: action,
                 team: self.team,
                 resource_object: self)
  end

  def after_create_project_create_event
    create_event('创建了项目')
  end
end
