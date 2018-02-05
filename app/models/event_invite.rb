class EventInvite < ApplicationRecord
  belongs_to :attending_event, class_name: "Event", dependent: :destroy
  belongs_to :event_invitee, class_name: "User"
end
