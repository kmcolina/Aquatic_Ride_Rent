class ObjetoAcuatico < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  validates :title, :location, :price, :capacity, presence: true
  validates :title, length: { minimum: 4 }
  validates :price, :numericality => { :greater_than => 0 }
  validates :capacity, :numericality => { :greater_than => 0 }
end
