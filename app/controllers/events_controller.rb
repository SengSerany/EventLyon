class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(title: params[:event][:title], start_date: params[:event][:start_date], duration: params[:event][:duration], location: params[:event][:location], price: params[:event][:price], description: params[:event][:description], admin: current_user)
    binding.pry
      if @event.save
        redirect_to event_path(@event.id)
      else
        render :new
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def event_params
  params.require(:event).permit(:title, :start_date, :duration, :location, :price, :description)
  end
end
