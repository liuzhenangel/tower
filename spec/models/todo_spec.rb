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

require 'rails_helper'

RSpec.describe Todo, type: :model do
  before do
    @team = create(:team)
    @project = build(:project, team: @team)
    @project.save
    @todolist = build(:todolist, project: @project)
    @todolist.save
  end

  it "正确创建一条todo" do
    todo = build(:todo, todolist: @todolist)
    expect( todo.save ).to be_truthy
    expect( Event.where(resource_object: todo).size ).to eq(1)
  end

  it "删除一条记录" do
    todo = build(:todo, todolist: @todolist)
    todo.save
    expect(Todo.all.size).to eq(1)
    expect( Event.where(resource_object: todo).size ).to eq(1)

    todo.destroy
    expect(Todo.all.size).to eq(0)
    expect( Event.where(resource_object: todo).size ).to eq(2)
  end

  it "完成一条记录" do
    todo = build(:todo, todolist: @todolist)
    todo.save
    todo.finish!
    expect( todo.finished? ).to be_truthy
    expect( Event.where(resource_object: todo).size ).to eq(2)
  end
end
