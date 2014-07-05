class Player < ActiveRecord::Base
  validates_presence_of :first_name, :email
end
