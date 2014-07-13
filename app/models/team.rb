class Team < ActiveRecord::Base

  belongs_to :tournament

  has_many :game_sessions, inverse_of: :team
  has_many :players, through: :game_sessions

  validates_presence_of :name, :tournament
  validates_numericality_of :score, only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 10

  accepts_nested_attributes_for :game_sessions

end
