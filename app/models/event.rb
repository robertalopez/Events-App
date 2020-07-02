class Event < ApplicationRecord
    belongs_to :user

    has_many :attendances
    has_many :attendees, through: :attendances, source: :user

    has_many :event_categories
    has_many :categories, through: :event_categories

    #Contiguous US: (-124.848974, 24.396308) to (-66.885444, 49.384358)
    validates :latitude, numericality: {
      greater_than: -124.848974,
      less_than: -66.885444,
      message: "appears to be outside of the contiguous United States."
    }
    validates :longitude, numericality: {
      greater_than: 24.396308,
      less_than: 49.384358,
      message: "appears to be outside of the contiguous United States."
    }
    
end
