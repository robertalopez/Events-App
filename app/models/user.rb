class User < ApplicationRecord

    has_secure_password

    has_many :events

    has_many :attendances
    has_many :attended_events, through: :attendances, source: :event

    validates :username, uniqueness: true 
    

    def average_event 
        categoriez = []
        self.events.each do |event|
            event.categories.each do |cat| 
                categoriez << cat 
            end 
        end 
        categoriez.max_by{|cat| categoriez.count(cat)}
    end 

    def most_popular
        self.events.max_by{|event| event.attendances.count}
    end 

end
