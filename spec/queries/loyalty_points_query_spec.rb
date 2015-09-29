require 'rails_helper'

RSpec.describe LoyaltyPointsQuery do
  let(:user) { FactoryGirl.build_stubbed(:user) }
  let(:subject) {described_class.new(user)}

  before(:each) do
    points = Random.new
    (1..14).each { |i| FactoryGirl.create(:point_line_item, created_at: i.months.ago, points: 25, user: user) }
    FactoryGirl.create(:point_line_item, created_at: 13.months.ago, points: -10, user: user)
  end

  it 'finds sum of expired points' do
    expect(subject.expired).to eq(40)
  end

  it 'discards expired points' do
    available = subject.available
    expired   = subject.expired
    expect { subject.discard(expired) }.to change(subject, :available).from(available).to(available - expired)
  end

end
