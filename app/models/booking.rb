class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :objeto_acuatico, dependent: :destroy
  validates :checkin, :checkout, :capacity, presence: true
end
