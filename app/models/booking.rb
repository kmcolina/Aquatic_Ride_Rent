class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :objeto_acuaticos
  validates :checkin, :checkout, :confirmation, :capacity, presence: true
end
