RSpec.shared_examples 'loyalty points' do
  let(:user) { FactoryGirl.build_stubbed(:user) }

  before(:each) do
    points = Random.new
    (1..14).each { |i| FactoryGirl.create(:point_line_item, created_at: i.months.ago, points: 25, user: user) }
    FactoryGirl.create(:point_line_item, created_at: 13.months.ago, points: -10, user: user)
  end
end
