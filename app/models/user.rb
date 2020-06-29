class User < ApplicationRecord
    has_many :attendances
    #has_many :events, through: :attendances, as: :attended_events 
    has_many :attended_events, through: :attendances, source: :event

    #has_many :events, as: :hosted_events
    has_many :hosted_events, source: :event 

    # alias_attribute :attendee, :user (no longer needed, done in event.rb)
end
