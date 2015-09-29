require 'rails_helper'

RSpec.describe ExpiredPointsQuery do
  include_examples 'expired points'
  describe 'lookup' do
    it 'find all expired points' do
      FactoryGirl.create(:point_line_item, created_at: 13.months.ago, points: -10, user: user)
      expect(subject.sum).to eq(15)
    end
  end
end
