require 'rails_helper'

RSpec.describe LoyaltyPointsQuery do
  include_examples 'loyalty points'

  let(:subject) {described_class.new(user)}


  it 'finds sum of expired points' do
    expect(subject.expired).to eq(40)
  end

  it 'discards expired points' do
    available = subject.available
    expired   = subject.expired
    expect { subject.discard(expired) }.to change(subject, :available).from(available).to(available - expired)
  end

end
