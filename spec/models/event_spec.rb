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
  it "创建了团队" do
    expect( create(:team) ).to be_truthy
    event = Event.first
    expect( event.action ).to eq('创建了团队')
  end

  it "创建了项目" do
    team = create(:team)
    project = build(:project, team_id: team.id)
    expect( project.save ).to be_truthy

    event = Event.where(resource_object: project).first
    expect( event.action ).to eq('创建了项目')
  end

  it "创建了任务" do
    team = create(:team)
    project = build(:project, team_id: team.id)
    project.save
    todolist = build(:todolist, project: project)
    todolist.save

    todo = build(:todo, todolist: todolist)
    expect( todo.save ).to be_truthy

    event = Event.where(resource_object: todo).first
    expect( event.action ).to eq('创建了任务')
  end

  it "删除了任务" do
    team = create(:team)
    project = build(:project, team_id: team.id)
    project.save
    todolist = build(:todolist, project: project)
    todolist.save

    todo = build(:todo, todolist: todolist)
    expect( todo.save ).to be_truthy

    todo.destroy
    event = Event.where(resource_object: todo).first
    expect( event.action ).to eq('删除了任务')
  end

  it "完成了任务" do
    team = create(:team)
    project = build(:project, team_id: team.id)
    project.save
    todolist = build(:todolist, project: project)
    todolist.save

    todo = build(:todo, todolist: todolist)
    expect( todo.save ).to be_truthy

    todo.finish!
    event = Event.where(resource_object: todo).first
    expect( event.action ).to eq('完成了任务')
  end

  it "重新打开了任务" do
    team = create(:team)
    project = build(:project, team_id: team.id)
    project.save
    todolist = build(:todolist, project: project)
    todolist.save

    todo = build(:todo, todolist: todolist)
    expect( todo.save ).to be_truthy

    todo.finish!
    todo.open!
    event = Event.where(resource_object: todo).first
    expect( event.action ).to eq('重新打开了任务')
  end

  it "将任务完成时间从xx 修改为xx" do
    team = create(:team)
    project = build(:project, team_id: team.id)
    project.save
    todolist = build(:todolist, project: project)
    todolist.save

    todo = build(:todo, todolist: todolist)
    expect( todo.save ).to be_truthy

    todo.end_time = Time.now
    todo.save
    event = Event.where(resource_object: todo).first
    expect( event.action ).to include('将任务完成时间从')
  end

  it "给 xx 指派了任务" do
    team = create(:team)
    project = build(:project, team_id: team.id)
    project.save
    todolist = build(:todolist, project: project)
    todolist.save
    user = create(:user)

    todo = create(:todo1, todolist: todolist)

    todo.user = user
    todo.save
    event = Event.where(resource_object: todo).first
    expect( event.action ).to include('指派了任务')
  end

  it '给 xx 的任务指派给 xx' do
    team = create(:team)
    project = build(:project, team_id: team.id)
    project.save
    todolist = build(:todolist, project: project)
    todolist.save
    user = create(:user)
    user2 = create(:user_test)

    todo = create(:todo, todolist: todolist, user: user)

    todo.user = user2
    todo.save

    event = Event.where(resource_object: todo).first
    expect( event.action ).to include('的任务指派给')
  end
end
