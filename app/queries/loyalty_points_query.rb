class LoyaltyPointsQuery
  def initialize(user)
    @user = user
  end

  def expired
    query(available: false)
  end

  def available
    query
  end

  def discard(amount, source = 'Points expired')
    PointLineItem.create!(points: -amount, source: source, user: @user)
  end

  private
  def query(available: true)
    direction = available ? '>' : '<'
    PointLineItem.where(["created_at #{direction} ? and user_id = ?", expiration_date, @user.id]).sum(:points)
  end

  def expiration_date
    Date.today - 12.months
  end
end
