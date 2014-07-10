class Player < ActiveRecord::Base

  has_many :game_sessions, inverse_of: :player
  has_many :teams, through: :game_sessions

  validates_presence_of :first_name
  validates :email, presence: true, email: true

  mount_uploader :avatar, AvatarUploader

end
