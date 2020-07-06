class Event < ApplicationRecord
    belongs_to :user

    has_many :attendances
    has_many :attendees, through: :attendances, source: :user

    has_many :event_categories
    has_many :categories, through: :event_categories

    # us_lat = {min: 24.396308, max: 49.384358}
    # us_long = {min: -124.848974, max: -66.885444}
    # validates :latitude, numericality: {
    #   greater_than: 24.396308,
    #   less_than: 49.384358,
    #   message: "appears to be outside of the contiguous United States."
    # }
    # validates :longitude, numericality: {
    #   greater_than: -124.848974,
    #   less_than: -66.885444,
    #   message: "appears to be outside of the contiguous United States."
    # }

    validates :xpos, numericality: {
      greater_than: -1.0,
      less_than: 1000.0,
      message: "appears to be outside of the contiguous United States."
    }
    validates :ypos, numericality: {
      greater_than: -1.0,
      less_than: 663.0,
      message: "appears to be outside of the contiguous United States."
    }

    def self.random_event
         Event.all.sample(1)
    end

    def self.most_popular
        Event.all.max_by{|event| event.attendances.count}
    end

    def self.most_recent
        Event.all.max_by{|event| event.id}
    end

end
