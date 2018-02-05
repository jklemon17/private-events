class RenameEventColumnInEventInvites < ActiveRecord::Migration[5.1]
  def change
    rename_column :event_invites, :event_id, :attending_event_id
    rename_column :event_invites, :invitee_id, :event_invitee_id
  end
end
