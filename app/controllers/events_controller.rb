class EventsController < ApplicationController
  def new
    @event = current_user.created_events.build
  end
  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:success] = "Event '#{@event.name}' created!"
      redirect_to @event
    else
      render 'new'
    end
  end
  def show
    @event = Event.find_by(id: params[:id])
    session[:event_id] = @event.id
  end
  def edit
  end
  def update
  end
  def destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :location)
  end

end
