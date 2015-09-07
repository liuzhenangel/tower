# == Schema Information
#
# Table name: accesses
#
#  id            :integer          not null, primary key
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  resource_type :string
#  resource_id   :integer
#  project_id    :integer
#

class Access < ActiveRecord::Base
  RESERVED = [ 'admin' ]
  has_and_belongs_to_many :users
  has_many :role_resources, dependent: :destroy
  belongs_to :project

  validates :name, presence: true, uniqueness:  true

  def self.all_without_reserved
    self.all.reject do |role|
      RESERVED.include?(role.name)
    end
  end

  def has_resource?(name)
    role_resources.where(resource_name: name).first
  end

  def not_admin?
    name != 'admin'
  end

  def role_resources_name
    self.role_resources.collect(&:resource_name)
  end

  def staffs_name
    self.staffs.collect(&:username)
  end

  def has_staff?(name)
    staffs.where(username: name).first
  end
end
