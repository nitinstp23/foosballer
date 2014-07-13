require 'rails_helper'

describe Tournament do

  describe '#played_on' do
    it 'return played on date' do
      tournament = create(:tournament)
      tournament.played_on.should eql Date.today
    end
  end

end
