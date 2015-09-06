# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  access_id              :integer
#

require 'carrierwave/orm/activerecord'
class User < ActiveRecord::Base
  mount_uploader :logo, LogoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :access
  has_many :events
  has_many :todos
  has_many :comments

  has_and_belongs_to_many :teams
  has_and_belongs_to_many :projects

  validate do
    errors.add(:teams, '至少有一个团队') if teams.size == 0
  end

  def self.current
    Thread.current[:user] || User.first
  end
  def self.current=(user)
    Thread.current[:user] = user
  end
end

