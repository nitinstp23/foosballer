class Tournament < ActiveRecord::Base

  has_many :teams

  def played_on
    @played_on ||= self.created_at.to_date
  end

end
