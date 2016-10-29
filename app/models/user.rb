# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates_presence_of :password, :on => :create


  def room_count
  	self.rooms.count
  end





  has_many :memberships
  has_many :rooms, through: :memberships
  has_many :posts, through: :memberships
end
