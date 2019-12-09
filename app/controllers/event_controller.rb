class EventController < ApplicationController
  def new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event is successfully created !"
      redirect_to @event
    else
      flash.now[:danger] = "Description or date field is empty."
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  private

    def event_params
      params.require(:event).permit(:description, :date)
    end
end