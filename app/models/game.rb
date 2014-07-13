class Game < ActiveRecord::Base

  belongs_to :tournament
  belongs_to :team_one, class_name: 'Team'
  belongs_to :team_two, class_name: 'Team'
  belongs_to :winner, class_name: 'Team'

  validates_presence_of :tournament,
                        :team_one,
                        :team_two

  validates_numericality_of :team_one_score, :team_two_score,
                            only_integer: true,
                            greater_than_or_equal_to: 0,
                            less_than_or_equal_to: 10

  validates_numericality_of :position, only_integer: true

  def team_one_name
    team_one.name
  end

  def team_two_name
    team_two.name
  end

end
