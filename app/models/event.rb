class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", dependent: :destroy
  has_many :event_invites, foreign_key: :attending_event_id
  has_many :event_invitees, through: :event_invites

end
