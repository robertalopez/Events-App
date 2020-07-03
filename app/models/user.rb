class User < ApplicationRecord

    has_secure_password

    has_many :events

    has_many :attendances
    has_many :attended_events, through: :attendances, source: :event

    validates :username, uniqueness: true 
    validates :password, presence: true
    

    def average_event 
        categoriez = [] 
        self.events.each do |event|
            event.categories.each do |cat| 
                categoriez << cat  
            end 
        end 
        categoriez.max_by{|cat| categoriez.count(cat)}
        if categoriez.empty?
            return "No events hosted yet!"
        end 
    end 

    def most_popular
        if self.events.empty?
            return "No events hosted yet!"
        else 
        self.events.max_by{|event| event.attendances.count}.title 
        end 
    end 

    def self.random_user 
        User.all.sample(1)
    end 

    def self.newest_user 
        User.all.max_by {|guy| guy.id}
    end 

    def self.most_events
        User.all.max_by{|guy| guy.events.count}
    end 

    def most_attended 
        max = 0 
        name = " "
        self.attendances.each do |att|
            if att.event.attendances.count > max 
                max = att.event.attendances.count 
                name = att.event.title 
            end 
        end 

         if max.zero?
            return "No events attended yet!"
         else 
            return name 
         end 
    end 

end
