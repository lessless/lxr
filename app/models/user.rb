class User < ActiveRecord::Base
  has_many :point_line_item
  validates :name, presence: true
end
