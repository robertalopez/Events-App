class EventsController < ApplicationController
  before_action :current_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @users = User.all
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    set_position

    if @event.valid?
      @event.save
      redirect_to @event
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to new_event_path
    end
  end

  def edit
    @users = User.all
  end

  def update
    set_position
    if @event.update(event_params)
      flash[:success] = "Event updated."
      redirect_to @event
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to edit_event_path
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:date, :location, :xpos, :ypos, :title, :user_id)
  end

  def current_event
    @event = Event.find(params[:id])
  end

  def set_position
    if @event.location
      @map_xmax = 1000
      @map_ymax = 662
      coords = Geocode.new(@event.location).scale_to_grid(@map_xmax, @map_ymax)
      @event.xpos = coords[:x]
      @event.ypos = coords[:y]
    end
  end

end
