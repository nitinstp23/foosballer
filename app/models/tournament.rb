class Tournament < ActiveRecord::Base

  def played_on
    @played_on ||= self.created_at.to_date
  end

end
