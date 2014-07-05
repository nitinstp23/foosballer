require 'rails_helper'

RSpec.describe Player, type: :model do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:email) }

  it 'should be valid' do
    player = create(:player, first_name: 'Nitin Misra', email: 'nitinmisra@email.com')
    player.should be_valid
  end
end
