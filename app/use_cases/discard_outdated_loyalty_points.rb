class DiscardOutdatedLoyaltyPoints
  include SolidUseCase

  steps :fetch_expired, :discard_expired

  def fetch_expired(user)
    points = LoyaltyPointsQuery.new(user).expired
    continue({user: user, points: points})
  end

  def discard_expired(params)
    discarded = LoyaltyPointsQuery.new(params[:user]).discard(params[:points])
    continue(discarded)
  end
end

