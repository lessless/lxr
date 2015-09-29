shared_examples_for 'expired points' do
  let(:user) { FactoryGirl.build_stubbed(:user) }
  let(:subject) {described_class.new(user)}

  before(:each) do
    points = Random.new
    (1..13).each { |i| FactoryGirl.create(:point_line_item, created_at: i.months.ago, points: 25, user: user) }
  end
end
