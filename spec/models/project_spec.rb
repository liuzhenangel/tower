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

require 'rails_helper'

RSpec.describe Project, type: :model do
  it "正确创建一条project" do
    team = create(:team)
    project = build(:project, team_id: team.id)
    expect( project.save ).to be_truthy

    event = Event.where(resource_object: project).first
    expect( event.action ).to eq('创建了项目')
  end
end
