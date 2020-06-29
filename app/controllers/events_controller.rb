class EventsController < ApplicationController
    def index 
        @events = Event.all 
    end 

    def new 
        current_event  
    end 

    def create
        event = Event.new(event_params)
    end 

    def edit 
        current_event
    end 

    def update 
        @event.update(event_params)
    end 

    def destroy 
        current_event
        @event.destroy
    end 

    private 

    def event_params
        params.require(:event).permit(:date, :longitude, :latitude, :title, :owner_id)
    end 

    def current_event 
        @event = Event.find(params[:id])
      end
end



