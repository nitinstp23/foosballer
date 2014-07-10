class GameSession < ActiveRecord::Base

  belongs_to :team
  belongs_to :player

  validates_presence_of :team, :player

end
