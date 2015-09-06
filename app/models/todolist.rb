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

class Todolist < ActiveRecord::Base
  belongs_to :project
  has_many :todos, dependent: :destroy
end
