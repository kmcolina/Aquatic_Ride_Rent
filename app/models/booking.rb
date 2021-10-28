class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :objeto_acuatico
  validates :checkin, :checkout, presence: true
end
