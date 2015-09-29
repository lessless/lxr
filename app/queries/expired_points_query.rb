class ExpiredPointsQuery
  attr_reader :collection
  def initialize(user)
    @user = user
  end

  def sum
    PointLineItem.where(['created_at < ?', expiration_date]).sum(:points)
  end

  private

  def expiration_date
    Date.today - 12.months
  end
end
