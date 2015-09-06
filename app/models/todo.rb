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

class Todo < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :user
  belongs_to :todolist
  has_many :comments, dependent: :destroy
  validates :name, presence: true

  after_create :after_create_todo_create_event
  after_destroy :after_destroy_todo_create_event
  before_update :before_update_todo_create_event

  include AASM
  aasm do
    state :opened, initial: true
    state :finished

    event :open do
      transitions from: :finished, to: :opened
      after do
        create_event('重新打开了任务')
      end
    end

    event :finish do
      transitions :from => :opened, :to => :finished
      after do
        create_event('完成了任务')
      end
    end
  end

  def no_appoint
    '未指派'
  end

  def username_and_endtime_is_nil?
    user.name.blank? || end_time.blank?
  end

  def create_event(action)
    Event.create(user: User.current,
                 action: action,
                 team: self.todolist.project.team,
                 resource_object: self)
  end

  private
  def before_update_todo_create_event
    if self.end_time != self.end_time_was
      create_event("将任务完成时间从 #{self.end_time_was.to_date} 修改为 #{self.end_time.to_date}")
    end

    if self.user_id != self.user_id_was && self.user_id_was.blank?
      create_event("给 #{self.user.name} 指派了任务")

    elsif self.user_id != self.user_id_was && self.user_id_was.present?
      user_was = User.find(user_id_was)
      create_event("把 #{user_was.name} 的任务指派给 #{self.user.name}")
    end
  end

  def after_create_todo_create_event
    create_event('创建了任务')
  end

  def after_destroy_todo_create_event
    create_event('删除了任务')
  end
end
