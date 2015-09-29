require 'rails_helper'
# require_relative '../../app/use_cases/discard_outdated_loyalty_points'

RSpec.describe DiscardOutdatedLoyaltyPoints do
  include_examples 'loyalty points'
  it 'runs successfully' do
    query     = LoyaltyPointsQuery.new(user)
    available = query.available
    expired   = query.expired
    result = nil
    expect { result = described_class.run(user) }.to change(query, :available).from(available).to(available - expired)
    expect(result).to be_a_success
  end
end
