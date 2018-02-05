class EventInvitesController < ApplicationController
  def new
    @event = Event.find_by(id: session[:event_id])
    @event_invite = @event.event_invites.build
  end
  def create
    @event = Event.find_by(id: session[:event_id])
    params[:event_invite][:event_invitee].each do |i|
      invite = @event.event_invites.build(event_invitee_id: i.to_i, accepted: false)
      invite.save
    end
    redirect_to @event
  end
  def edit
    @event = Event.find_by(id: params[:event_id])
    @user = User.find_by(id: params[:user_id])
    @event_invite = @event.event_invites.find_by(event_invitee_id: @user.id)
    toggle_accepted
    redirect_to @user
  end

  private

  def toggle_accepted
    if @event_invite.accepted
      @event_invite.update_columns(accepted: false)
    else
      @event_invite.update_columns(accepted: true)
    end
  end
end
