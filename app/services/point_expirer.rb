class PointExpirer
  def expire(date, user)
    expired = PointLineItem.where(["created_at < ?  and user_id = ?", date - 12.months, user.id]).sum(:points)
    PointLineItem.create!(points: -expired, source: 'Points Expired' , user: user)
  end
end
