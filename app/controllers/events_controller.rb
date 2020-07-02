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
    params.require(:event).permit(:date, :longitude, :latitude, :title, :user_id)
  end

  def current_event
    @event = Event.find(params[:id])
  end

end
