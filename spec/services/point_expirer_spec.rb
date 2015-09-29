require 'rails_helper'

RSpec.describe PointExpirer do
  include_examples 'loyalty points'

  it 'expires points on a given date' do
    date = Date.today
    expect { described_class.new.expire(date, user) }.to change {
      PointLineItem.where(user: user).sum(:points)
    }.from(340).to(300)
  end
end
