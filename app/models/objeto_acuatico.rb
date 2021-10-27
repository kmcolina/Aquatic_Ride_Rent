class ObjetoAcuatico < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, :location, :price, :capacity, presence: true
  validates :title, length: { minimum: 4 }
  validates :price, :numericality => { :greater_than => 0 }
  validates :capacity, :numericality => { :greater_than => 0 }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def markers
    {
      lat: self.latitude,
      lng: self.longitude
    }
  end
end
