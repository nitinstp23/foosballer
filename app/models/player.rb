class Player < ActiveRecord::Base

  validates_presence_of :first_name
  validates :email, presence: true, email: true

  mount_uploader :avatar, AvatarUploader

end
