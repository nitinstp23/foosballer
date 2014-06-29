require 'rails_helper'

describe Tournament do

  describe '#played_on' do
    it 'return played on date' do
      tournament = create(:tournament)
      expect(tournament.played_on).to eq Date.today
    end
  end
end
