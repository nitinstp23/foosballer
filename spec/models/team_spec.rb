require 'rails_helper'

RSpec.describe Team, type: :model do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:tournament) }
  it { should validate_numericality_of(:score) }

  it 'should be valid' do
    tournament = create(:tournament)
    team = create(:team, name: 'Team 1', score: 1, tournament: tournament)
    team.should be_valid
  end

end
