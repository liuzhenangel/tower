# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  todo_id    :integer
#  user_id    :integer
#

class Comment < ActiveRecord::Base
  belongs_to :todo
  belongs_to :user
  after_create :after_create_comment_create_event

  private
  def create_event(action)
    Event.create(user: self.user,
                 action: action,
                 content: self.content,
                 team: self.todo.todolist.project.team,
                 resource_object: self.todo)
  end
  def after_create_comment_create_event
    create_event("回复了任务")
  end
end
