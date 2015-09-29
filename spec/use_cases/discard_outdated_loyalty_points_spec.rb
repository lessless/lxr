require 'rails_helper'
require_relative '../../app/use_cases/discard_outdated_loyalty_points'

RSpec.describe UseCases::DiscardOutdatedLoyaltyPoints do
  include_examples 'loyalty points'
  it 'runs successfully' do
    result = described_class.run(user)
    expect(result).to be_a_success
  end
end
