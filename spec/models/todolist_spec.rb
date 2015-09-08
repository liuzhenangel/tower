# == Schema Information
#
# Table name: todolists
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer
#

require 'rails_helper'

RSpec.describe Todolist, type: :model do
  it "正确创建一条todolist" do
    expect( create(:todolist) ).to be_truthy
  end
end
