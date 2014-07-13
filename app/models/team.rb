class Team < ActiveRecord::Base

  belongs_to :tournament

  has_many :game_sessions, inverse_of: :team
  has_many :players, through: :game_sessions

  validates_presence_of :name

  accepts_nested_attributes_for :game_sessions

end
