class PointLineItem < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :points, :source, presence: true
end
