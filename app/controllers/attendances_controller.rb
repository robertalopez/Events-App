class AttendancesController < ApplicationController

    def new
        @attendance = Attendance.new  
        @events = Event.all 
        render :template => 'events/attendances/new'
    end

    def create 
        @attendance = Attendance.create(attendance_params)
        redirect_to event_path(@attendance.event)
    end 


    private
    
    def attendance_params
        params.require(:attendance).permit(:user_id, :event_id)
    end 

end 