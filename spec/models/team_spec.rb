# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Team, type: :model do
  it "正确创建一条todo" do
    expect( create(:team) ).to be_truthy
    event = Event.first
    expect( event.action ).to eq('创建了团队')
  end
end
